import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_state.dart';

part 'app_service.g.dart';

@Riverpod(keepAlive: true)
class AppService extends _$AppService {
  @override
  AppState build() {
    return const AppState();
  }

  void newGame(int average) {
    print("AVERAGE: $average");
    state = state.copyWith(average: average);
  }

  // void drive(RecordSheetState initialState) => state = state.copyWith(
  //   initialTeamBuilderState: const Optional<Team>.absent(),
  //   initialRecordSheetState: Optional<RecordSheetState>.of(initialState),
  // );
  //
  // void buildNewTeam() {
  //   final team = Team(id: uuid.v4(), name: generateRandomName());
  //
  //   state = state.copyWith(
  //     initialTeamBuilderState: Optional<Team>.of(team),
  //     initialRecordSheetState: const Optional<RecordSheetState>.absent(),
  //   );
  //
  //   ref.read(teamsCtrlProvider.notifier).newTeam(team);
  // }
  //
  // void buildTeam(Team team) => state = state.copyWith(
  //   initialTeamBuilderState: Optional<Team>.of(team),
  //   initialRecordSheetState: const Optional<RecordSheetState>.absent(),
  // );
}
