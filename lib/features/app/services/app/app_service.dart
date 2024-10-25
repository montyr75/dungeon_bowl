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
  AppState build() => const AppState();

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
    return SavedGame(
      version: version,
      appState: state,
      gameState: ref.read(gameServiceProvider),
    ).toJson();
  }

  void saveState() {
    ref.read(secureStorageRepoProvider).write(
          key: StorageKey.savedGame.toKey(),
          value: serializeGameData(),
        );
  }
}
