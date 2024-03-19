
import '../../../../data/bowler_levels.dart';
import '../../../../data/characters.dart';

class AppState {
  final int average;
  final BowlerLevel bowlerLevel;
  final Character character;

  const AppState({
    this.average = 0,
    this.bowlerLevel = BowlerLevel.beginner,
    this.character = Character.russellRollington,
  });

  AppState copyWith({
    int? average,
    BowlerLevel? bowlerLevel,
    Character? character,
  }) {
    return AppState(
      average: average ?? this.average,
      bowlerLevel: bowlerLevel ?? this.bowlerLevel,
      character: character ?? this.character,
    );
  }

  bool get hasValidAverage => average > 0 && average <= 300;
}
