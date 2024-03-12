
class AppState {
  final int average;
  // final RecordSheetState? initialRecordSheetState;

  const AppState({
    this.average = 0,
  });

  AppState copyWith({
    int? average,
  }) {
    return AppState(
      average: average ?? this.average,
    );
  }

  bool get hasValidAverage => average > 0 && average <= 300;
}
