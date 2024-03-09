
class AppState {
  // final Team? initialTeamBuilderState;
  // final RecordSheetState? initialRecordSheetState;

  const AppState(/*{
    this.initialTeamBuilderState,
    this.initialRecordSheetState,
  }*/);

  // AppState copyWith({
  //   Optional<Team>? initialTeamBuilderState,
  //   Optional<RecordSheetState>? initialRecordSheetState,
  // }) {
  //   return AppState(
  //     initialTeamBuilderState: initialTeamBuilderState == null ? this.initialTeamBuilderState : initialTeamBuilderState.orNull,
  //     initialRecordSheetState: initialRecordSheetState == null ? this.initialRecordSheetState : initialRecordSheetState.orNull,
  //   );
  // }
  //
  // AppMode get appMode => initialTeamBuilderState != null ? AppMode.builder : AppMode.dashboard;
}

enum AppMode {
  builder,
  dashboard,
}