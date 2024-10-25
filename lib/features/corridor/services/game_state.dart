import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/active_character.dart';
import '../../../models/encounter_result.dart';

part 'game_state.mapper.dart';

@MappableClass()
class GameState with GameStateMappable {
  final ActiveCharacter character;
  final int game;
  final int frame;
  final List<EncounterResultBase> encounterHistory;

  const GameState({
    required this.character,
    this.game = 1,
    this.frame = 1,
    this.encounterHistory = const [],
  });

  bool get canFindLair => frame < 9;
}

extension ListEncounterResultX on List<EncounterResultBase> {
  List<EncounterResult> get encounterResults => whereType<EncounterResult>().toList();

  List<EncounterResultBase> get lairEncounterResults =>
      where((value) => value is LairEncounterResult || value is FoundLairEncounterResult).toList();

  List<List<EncounterResultBase>> get byGame {
    final result = <List<EncounterResultBase>>[];

    if (isNotEmpty) {
      for (int i = 0; i < last.game; i++) {
        result.add(where((enc) => enc.game == i + 1).toList());
      }
    }

    return result;
  }
}