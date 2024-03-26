import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';

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

  @override
  String toString() {
    return 'LairState{enounterLevel: $enounterLevel, encounter: $encounter, challenge: $challenge, strength: $strength}';
  }
}