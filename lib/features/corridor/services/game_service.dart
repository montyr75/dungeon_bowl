import 'package:dartx/dartx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/treasure.dart';
import '../../../models/active_character.dart';
import '../../../models/encounter_result.dart';
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

  void roomSuccess(RoomState roomState, Treasure treasure) {
    GameState newState = _nextFrame(state);
    newState = _updateGP(newState, treasure.value);

    state = _updateEncounterHistory(
      newState,
      roomState.toEncounterResult(game: state.game, isSuccess: true),
    );
  }

  void roomFailure(RoomState roomState) {
    GameState newState = _nextFrame(state);

    state = _updateEncounterHistory(
      newState,
      roomState.toEncounterResult(game: state.game, isSuccess: false),
    );
  }

  void lairSuccess(LairState lairState, Treasure treasure) {
    GameState newState = _nextFrame(state);
    newState = _updateGP(newState, treasure.value);

    state = _updateEncounterHistory(
      newState,
      lairState.toEncounterResult(game: state.game, isSuccess: true),
    );
  }

  void lairFailure(LairState lairState) {
    GameState newState = _nextFrame(state);

    state = _updateEncounterHistory(
      newState,
      lairState.toEncounterResult(game: state.game, isSuccess: false),
    );
  }

  void foundLairSuccess(FoundLairState foundLairState, [Treasure? treasure]) {
    GameState newState = _nextFrame(state);

    if (treasure == null) {
      state = newState;
      return;
    }

    newState = _updateGP(newState, treasure.value);

    state = _updateEncounterHistory(
      newState,
      foundLairState.toEncounterResult(game: state.game, isSuccess: true),
    );
  }

  void foundLairFailure(FoundLairState foundLairState) {
    GameState newState = _nextFrame(state);

    state = _updateEncounterHistory(
      newState,
      foundLairState.toEncounterResult(game: state.game, isSuccess: false),
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
    return state.copyWith(
      encounterHistory: List.unmodifiable(
        state.encounterHistory.toList()..add(encounter),
      ),
    );
  }

  GameReport generateReport() {
    return GameReport(
      encounterResults: List.unmodifiable(state.encounterHistory.encounterResults),
      lairEncounterResults: List.unmodifiable(state.encounterHistory.lairEncounterResults),
    );
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
