import '../../../models/active_character.dart';
import '../../../models/encounter_result.dart';

class GameState {
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

  GameState copyWith({
    ActiveCharacter? character,
    int? game,
    int? frame,
    List<EncounterResultBase>? encounterHistory,
  }) {
    return GameState(
      character: character ?? this.character,
      game: game ?? this.game,
      frame: frame ?? this.frame,
      encounterHistory: encounterHistory ?? this.encounterHistory,
    );
  }

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