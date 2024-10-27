import 'package:dart_mappable/dart_mappable.dart';

import '../../../../app_config.dart';
import '../../../../data/bowler_levels.dart';
import '../../../../data/characters.dart';
import '../../../../models/saved_game.dart';

part 'app_state.mapper.dart';

@MappableClass()
class AppState with AppStateMappable{
  final BowlerLevel bowlerLevel;
  final Character? character;
  final SavedGame? savedGame;

  const AppState({
    this.bowlerLevel = BowlerLevel.beginner,
    this.character,
    this.savedGame,
  });

  bool get hasValidSave => savedGame != null && savedGame!.version == version;

  bool get isGameActive => character != null;
}
