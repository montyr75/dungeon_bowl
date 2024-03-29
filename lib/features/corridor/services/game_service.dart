import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/active_character.dart';
import '../../../models/encounter_result.dart';
import '../../app/services/app/app_service.dart';
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

  void roomSuccess(RoomState roomState) {
    GameState newState = _nextFrame(state);
    newState = _updateGP(newState, 1);

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

  void lairSuccess(LairState lairState) {
    GameState newState = _nextFrame(state);
    newState = _updateGP(newState, 3);

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
}
