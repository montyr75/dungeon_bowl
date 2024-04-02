import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../models/encounter_result.dart';

class FoundLairState {
  final int enounterLevel;
  final LairEncounter encounter;
  final BowlingChallenge challenge1;
  final BowlingChallenge challenge2;
  final int? strength;
  final bool isChallenge1Success;

  const FoundLairState({
    required this.enounterLevel,
    required this.encounter,
    required this.challenge1,
    required this.challenge2,
    this.strength,
    this.isChallenge1Success = false,
  });

  FoundLairState copyWith({
    int? enounterLevel,
    LairEncounter? encounter,
    BowlingChallenge? challenge1,
    BowlingChallenge? challenge2,
    int? strength,
    bool? isChallenge1Success,
  }) {
    return FoundLairState(
      enounterLevel: enounterLevel ?? this.enounterLevel,
      encounter: encounter ?? this.encounter,
      challenge1: challenge1 ?? this.challenge1,
      challenge2: challenge2 ?? this.challenge2,
      strength: strength ?? this.strength,
      isChallenge1Success: isChallenge1Success ?? this.isChallenge1Success,
    );
  }

  FoundLairEncounterResult toEncounterResult({required int game, required bool isSuccess}) {
    return FoundLairEncounterResult(
      game: game,
      enounterLevel: enounterLevel,
      strength: strength,
      encounter: encounter,
      challenge1: challenge1,
      challenge2: challenge2,
      isSuccess: isSuccess,
    );
  }

  @override
  String toString() {
    return 'FoundLairState{enounterLevel: $enounterLevel, encounter: $encounter, challenge1: ${challenge1.toDisplay(strength)}, challenge2: ${challenge2.toDisplay(strength)}, strength: $strength}';
  }
}