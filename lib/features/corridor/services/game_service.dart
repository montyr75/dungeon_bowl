import 'package:dartx/dartx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/treasure.dart';
import '../../../models/active_character.dart';
import '../../../models/encounter_result.dart';
import '../../../models/frame.dart';
import '../../../routes.dart';
import '../../../utils/roller.dart';
import '../../../utils/utils.dart';
import '../../app/services/app/app_service.dart';
import '../../lair/controllers/found_lair_state.dart';
import '../../lair/controllers/lair_state.dart';
import '../../room/controllers/room_state.dart';
import 'game_state.dart';

part 'game_service.g.dart';

@riverpod
class GameService extends _$GameService {
  @override
  GameState build() {
    final appState = ref.read(appServiceProvider);

    return GameState(
      character: ActiveCharacter(character: appState.character),
    );
  }

  AppRoute nextRoom() {
    final report = generateReport();
    final chanceOfSpecial = report.percentFailure.maxOf(50);

    if (rollPercent(chanceOfSpecial)) {
      return AppRoute.fork;
    }

    return AppRoute.room;
  }

  void roomSuccess({
    required RoomState roomState,
    required Frame frameData,
    required Treasure treasure,
  }) {
    GameState newState = _nextFrame(state);
    newState = _updateGP(newState, treasure.value);

    state = _updateEncounterHistory(
      newState,
      roomState.toEncounterResult(
        game: state.game,
        frame: state.frame,
        frameData: frameData,
        isSuccess: true,
      ),
    );
  }

  void roomFailure({required RoomState roomState, required Frame frameData}) {
    GameState newState = _nextFrame(state);

    state = _updateEncounterHistory(
      newState,
      roomState.toEncounterResult(
        game: state.game,
        frame: state.frame,
        frameData: frameData,
        isSuccess: false,
      ),
    );
  }

  void lairSuccess({
    required LairState lairState,
    required Frame frameData,
    required Treasure treasure,
  }) {
    GameState newState = _nextFrame(state);
    newState = _updateGP(newState, treasure.value);

    state = _updateEncounterHistory(
      newState,
      lairState.toEncounterResult(
        game: state.game,
        frame: state.frame,
        frameData: frameData,
        isSuccess: true,
      ),
    );
  }

  void lairFailure({required LairState lairState, required Frame frameData}) {
    GameState newState = _nextFrame(state);

    state = _updateEncounterHistory(
      newState,
      lairState.toEncounterResult(
        game: state.game,
        frame: state.frame,
        frameData: frameData,
        isSuccess: false,
      ),
    );
  }

  void foundLairSuccess({
    required FoundLairState foundLairState,
    required Frame frameData,
    Treasure? treasure,
  }) {
    GameState newState = _nextFrame(state);

    if (treasure != null) {
      newState = _updateGP(newState, treasure.value);
    }

    state = _updateEncounterHistory(
      newState,
      foundLairState.toEncounterResult(
        game: state.game,
        frame: state.frame,
        frameData: frameData,
        isSuccess: true,
      ),
    );
  }

  void foundLairFailure({required FoundLairState foundLairState, required Frame frameData}) {
    GameState newState = _nextFrame(state);

    state = _updateEncounterHistory(
      newState,
      foundLairState.toEncounterResult(
        game: state.game,
        frame: state.frame,
        frameData: frameData,
        isSuccess: false,
      ),
    );
  }

  void awardGP(int value) {
    state = _updateGP(state, value);
  }

  GameState _nextFrame(GameState state) {
    final isNewGame = state.frame == 10;

    return state.copyWith(
      game: isNewGame ? state.game + 1 : null,
      frame: !isNewGame ? state.frame + 1 : 1,
    );
  }

  GameState _updateGP(GameState state, int value) {
    return state.copyWith(
      character: state.character.copyWith(gp: state.character.gp + value),
    );
  }

  GameState _updateEncounterHistory(GameState state, EncounterResultBase encounter) {
    final encounterHistory = state.encounterHistory.toList()..add(encounter);

    final games = encounterHistory.byGame;

    encounterHistory.clear();

    for (final game in games) {
      encounterHistory.addAll(_scoreGame(game));
    }

    return state.copyWith(
      encounterHistory: List.unmodifiable(
        List.unmodifiable(encounterHistory),
      ),
    );
  }

  GameReport generateReport() {
    return GameReport(
      encounterResults: List.unmodifiable(state.encounterHistory.encounterResults),
      lairEncounterResults: List.unmodifiable(state.encounterHistory.lairEncounterResults),
    );
  }

  List<EncounterResultBase> _scoreGame(List<EncounterResultBase> game) {
    int score = 0;

    final frames = game.map((enc) => enc.frameData).toList();

    return game.map((enc) {
      final frameScore = _scoreFrame(enc.frame - 1, frames);

      if (frameScore != null) {
        return enc.copyWith(
          frameData: enc.frameData.copyWith(
            score: score += frameScore,
          ),
        );
      }

      return enc;
    }).toList();
  }

  int? _scoreFrame(int frameIndex, List<Frame> frames) {
    final frame = frames[frameIndex];

    int? score;

    if (frame is TenthFrame) {
      if (frame.isStrike) {
        final nextTwoThrows = frame.throws.skip(1).whereNotNull();
        score = 10 + nextTwoThrows.sum();
      }
      else if (frame.isSpare) {
        score = 10 + (frame.thirdThrow ?? 0);
      }
      else {
        score = frame.throws.whereNotNull().sum();
      }
    }
    else {
      final nextTwoThrows = [
        if (frames.length >= frameIndex + 2) ...frames[frameIndex + 1].throws,
        if (frames.length >= frameIndex + 3) ...frames[frameIndex + 2].throws,
      ].whereNotNull().take(2);

      if (frame.isStrike) {
        if (nextTwoThrows.length == 2) {
          score = 10 + nextTwoThrows.sum();
        }
      }
      else if (frame.isSpare) {
        if (nextTwoThrows.isNotEmpty) {
          score = 10 + nextTwoThrows.first;
        }
      }
      else {
        score = frame.throws.whereNotNull().sum();
      }
    }

    return score;
  }
}

class GameReport {
  final List<EncounterResult> encounterResults;
  final List<EncounterResultBase> lairEncounterResults;

  const GameReport({
    required this.encounterResults,
    required this.lairEncounterResults,
  });

  int get encountersWon => encounterResults.count((value) => value.isSuccess);

  int get totalEncounters => encounterResults.length;

  int get lairsWon => lairEncounterResults.count((value) => value.isSuccess);

  int get totalLairs => lairEncounterResults.length;

  int get percentEncountersWon {
    if (totalEncounters == 0 || encountersWon == 0) {
      return 0;
    }

    return (encountersWon / totalEncounters * 100).round();
  }

  int get percentLairEncountersWon {
    if (totalLairs == 0 || lairsWon == 0) {
      return 0;
    }

    return (lairsWon / totalLairs * 100).round();
  }

  int get percentSuccess {
    final total = totalEncounters + totalLairs;
    final totalWon = encountersWon + lairsWon;

    if (total == 0 || totalWon == 0) {
      return 0;
    }

    return (totalWon / total * 100).round();
  }

  int get percentFailure {
    final total = totalEncounters + totalLairs;
    final int totalLost = total - (encountersWon + lairsWon);

    if (total == 0 || totalLost == 0) {
      return 0;
    }

    return (totalLost / total * 100).round();
  }
}
