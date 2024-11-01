import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../models/encounter_result.dart';
import '../../../models/frame.dart';

class BossLairState {
  final int encounterLevel;
  final LairEncounter encounter;
  final TenthFrameBowlingChallenge challenge;
  final int? strength;

  const BossLairState({
    required this.encounterLevel,
    required this.encounter,
    required this.challenge,
    this.strength,
  });

  BossLairState copyWith({
    int? encounterLevel,
    LairEncounter? encounter,
    TenthFrameBowlingChallenge? challenge,
    int? strength,
  }) {
    return BossLairState(
      encounterLevel: encounterLevel ?? this.encounterLevel,
      encounter: encounter ?? this.encounter,
      challenge: challenge ?? this.challenge,
      strength: strength ?? this.strength,
    );
  }

  BossLairEncounterResult toEncounterResult({
    required int game,
    required int frame,
    required Frame frameData,
    required bool isSuccess,
  }) {
    return BossLairEncounterResult(
      game: game,
      frame: frame,
      encounterLevel: encounterLevel,
      strength: strength,
      encounter: encounter,
      challenge: challenge,
      frameData: frameData,
      isSuccess: isSuccess,
    );
  }

  @override
  String toString() {
    return 'BossLairState{enounterLevel: $encounterLevel, encounter: $encounter, strength: $strength, challenge: ${challenge.toDisplay(strength)}}';
  }
}
