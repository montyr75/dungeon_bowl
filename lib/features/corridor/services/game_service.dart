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

  void nextRoom() {
    state = state.copyWith(
      frame: state.frame + 1,
    );
  }
}
