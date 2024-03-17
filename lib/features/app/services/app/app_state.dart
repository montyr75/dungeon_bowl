
import '../../../../data/bowler_levels.dart';

class AppState {
  final int average;
  final BowlerLevel bowlerLevel;
  // final RecordSheetState? initialRecordSheetState;

  const AppState({
    this.average = 0,
    this.bowlerLevel = BowlerLevel.beginner,
  });

  AppState copyWith({
    int? average,
    BowlerLevel? bowlerLevel,
  }) {
    return AppState(
      average: average ?? this.average,
      bowlerLevel: bowlerLevel ?? this.bowlerLevel,
    );
  }

  bool get hasValidAverage => average > 0 && average <= 300;
}
