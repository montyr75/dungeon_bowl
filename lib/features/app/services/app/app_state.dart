import 'package:dart_mappable/dart_mappable.dart';

import '../../../../data/bowler_levels.dart';
import '../../../../data/characters.dart';

part 'app_state.mapper.dart';

@MappableClass()
class AppState with AppStateMappable{
  final BowlerLevel bowlerLevel;
  final Character? character;

  const AppState({
    this.bowlerLevel = BowlerLevel.beginner,
    this.character,
  });
}
