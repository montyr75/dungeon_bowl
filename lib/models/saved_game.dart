import 'package:dart_mappable/dart_mappable.dart';

import '../features/app/services/app/app_state.dart';
import '../features/corridor/services/game_state.dart';

part 'saved_game.mapper.dart';

@MappableClass()
class SavedGame with SavedGameMappable {
  final String version;
  final DateTime timeStamp;
  final AppState appState;
  final GameState gameState;

  SavedGame({
    required this.version,
    required this.timeStamp,
    required this.appState,
    required this.gameState,
  });

  factory SavedGame.now({
    required String version,
    required AppState appState,
    required GameState gameState,
  }) {
    return SavedGame(
      version: version,
      timeStamp: DateTime.now(),
      appState: appState,
      gameState: gameState,
    );
  }

  static SavedGame fromJson(String json) => SavedGameMapper.fromJson(json);
}
