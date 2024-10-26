import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../app_config.dart';
import '../../../../data/bowler_levels.dart';
import '../../../../data/bowling_tips.dart';
import '../../../../data/characters.dart';
import '../../../../models/saved_game.dart';
import '../../../../utils/roller.dart';
import '../../../corridor/services/game_service.dart';
import '../../repos/secure_storage/secure_storage_repo.dart';
import 'app_state.dart';

part 'app_service.g.dart';

@Riverpod(keepAlive: true)
class AppService extends _$AppService {
  @override
  AppState build() {
    _loadState();

    return const AppState();
  }

  void selectBowlerLevel(BowlerLevel value) {
    state = state.copyWith(
      bowlerLevel: value,
    );
  }

  void selectCharacter(Character value) {
    state = state.copyWith(
      character: value,
    );
  }

  String getBowlingTip() => bowlingTips[rand(bowlingTips.length)];

  String serializeGameData() {
    return SavedGame.now(
      version: version,
      appState: state,
      gameState: ref.read(gameServiceProvider),
    ).toJson();
  }

  Future<void> _loadState() async {
    final json = await ref.read(secureStorageRepoProvider).read(StorageKey.savedGame.toKey());

    if (json != null) {
      state = state.copyWith(
        savedGame: SavedGame.fromJson(json),
      );
    }
  }

  void restoreState() {
    final savedGame = state.savedGame;

    if (savedGame != null) {
      state = AppState(
        bowlerLevel: savedGame.appState.bowlerLevel,
        character: savedGame.appState.character,
      );

      ref.read(gameServiceProvider.notifier).restore(savedGame.gameState);
    }
  }

  void saveState() {
    ref.read(secureStorageRepoProvider).write(
          key: StorageKey.savedGame.toKey(),
          value: serializeGameData(),
        );
  }

  void clearSaves() {
    ref.read(secureStorageRepoProvider).deleteAll();
  }
}
