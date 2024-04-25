
import '../../../../data/bowler_levels.dart';
import '../../../../data/characters.dart';

class AppState {
  final BowlerLevel bowlerLevel;
  final Character character;

  const AppState({
    this.bowlerLevel = BowlerLevel.beginner,
    this.character = Character.russellRollington,
  });

  AppState copyWith({
    BowlerLevel? bowlerLevel,
    Character? character,
  }) {
    return AppState(
      bowlerLevel: bowlerLevel ?? this.bowlerLevel,
      character: character ?? this.character,
    );
  }
}
