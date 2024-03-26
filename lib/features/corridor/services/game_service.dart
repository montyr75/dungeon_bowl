import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/active_character.dart';
import '../../app/services/app/app_service.dart';
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

  void nextFrame() {
    final isNewGame = state.frame == 10;

    state = state.copyWith(
      game: isNewGame ? state.game + 1 : null,
      frame: !isNewGame ? state.frame + 1 : 1,
    );
  }

  void roomSuccess() {
    nextFrame();
    _updateGP(1);
  }

  void roomFailure() {
    nextFrame();
  }

  void lairSuccess() {
    nextFrame();
    _updateGP(3);
  }

  void lairFailure() {
    nextFrame();
  }

  void _updateGP(int value) {
    state = state.copyWith(
      character: state.character.copyWith(gp: state.character.gp + value),
    );
  }
}
