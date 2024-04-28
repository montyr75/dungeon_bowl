import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../models/encounter_result.dart';
import '../../../models/frame.dart';

class LairState {
  final int enounterLevel;
  final LairEncounter encounter;
  final TenthFrameBowlingChallenge challenge;
  final int? strength;

  const LairState({
    required this.enounterLevel,
    required this.encounter,
    required this.challenge,
    this.strength,
  });

  LairState copyWith({
    int? enounterLevel,
    LairEncounter? encounter,
    TenthFrameBowlingChallenge? challenge,
    int? strength,
  }) {
    return LairState(
      enounterLevel: enounterLevel ?? this.enounterLevel,
      encounter: encounter ?? this.encounter,
      challenge: challenge ?? this.challenge,
      strength: strength ?? this.strength,
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
      encounterLevel: enounterLevel,
      strength: strength,
      encounter: encounter,
      challenge: challenge,
      frameData: frameData,
      isSuccess: isSuccess,
    );
  }

  @override
  String toString() {
    return 'LairState{enounterLevel: $enounterLevel, encounter: $encounter, strength: $strength, challenge: ${challenge.toDisplay(strength)}}';
  }
}
