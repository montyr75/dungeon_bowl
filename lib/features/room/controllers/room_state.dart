import '../../../data/bowling_challenges.dart';
import '../../../data/encounters.dart';
import '../../../models/encounter_result.dart';

class RoomState {
  final int enounterLevel;
  final Encounter encounter;
  final BowlingChallenge challenge;
  final int? strength;

  const RoomState({
    required this.enounterLevel,
    required this.encounter,
    required this.challenge,
    this.strength,
  });

  RoomState copyWith({
    int? enounterLevel,
    Encounter? encounter,
    BowlingChallenge? challenge,
    int? strength,
  }) {
    return RoomState(
      enounterLevel: enounterLevel ?? this.enounterLevel,
      encounter: encounter ?? this.encounter,
      challenge: challenge ?? this.challenge,
      strength: strength ?? this.strength,
    );
  }

  EncounterResult toEncounterResult({required int game, required bool isSuccess}) {
    return EncounterResult(
      game: game,
      enounterLevel: enounterLevel,
      strength: strength,
      encounter: encounter,
      challenge: challenge,
      isSuccess: isSuccess,
    );
  }

  @override
  String toString() {
    return 'RoomState{enounterLevel: $enounterLevel, encounter: $encounter, strength: $strength, challenge: ${challenge.toDisplay(strength)}}';
  }
}
