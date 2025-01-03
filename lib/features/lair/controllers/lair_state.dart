import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../models/encounter_result.dart';
import '../../../models/frame.dart';

class LairState {
  final int encounterLevel;
  final LairEncounter encounter;
  final BowlingChallenge challenge1;
  final BowlingChallenge challenge2;
  final int? strength;
  final bool isChallenge1Success;

  const LairState({
    required this.encounterLevel,
    required this.encounter,
    required this.challenge1,
    required this.challenge2,
    this.strength,
    this.isChallenge1Success = false,
  });

  LairState copyWith({
    int? encounterLevel,
    LairEncounter? encounter,
    BowlingChallenge? challenge1,
    BowlingChallenge? challenge2,
    int? strength,
    bool? isChallenge1Success,
  }) {
    return LairState(
      encounterLevel: encounterLevel ?? this.encounterLevel,
      encounter: encounter ?? this.encounter,
      challenge1: challenge1 ?? this.challenge1,
      challenge2: challenge2 ?? this.challenge2,
      strength: strength ?? this.strength,
      isChallenge1Success: isChallenge1Success ?? this.isChallenge1Success,
    );
  }

  LairEncounterResult toEncounterResult({
    required int game,
    required int frame,
    required Frame frameData,
    required bool isSuccess,
  }) {
    return LairEncounterResult(
      game: game,
      frame: frame,
      encounterLevel: encounterLevel,
      strength: strength,
      encounter: encounter,
      challenge1: challenge1,
      challenge2: challenge2,
      frameData: frameData,
      isSuccess: isSuccess,
    );
  }

  @override
  String toString() {
    return 'LairState{enounterLevel: $encounterLevel, encounter: $encounter, challenge1: ${challenge1.toDisplay(strength)}, challenge2: ${challenge2.toDisplay(strength)}, strength: $strength}';
  }
}
