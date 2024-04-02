import '../data/bowling_challenges.dart';
import '../data/encounters.dart';
import '../data/lair_encounters.dart';

abstract class EncounterResultBase {
  final int game;
  final int enounterLevel;
  final int? strength;
  final bool isSuccess;

  const EncounterResultBase({
    required this.game,
    required this.enounterLevel,
    this.strength,
    this.isSuccess = false,
  });

  bool get isLair;
  bool get isFailure => !isSuccess;
}

class EncounterResult extends EncounterResultBase {
  final Encounter encounter;
  final BowlingChallenge challenge;

  const EncounterResult({
    required super.game,
    required super.enounterLevel,
    super.strength,
    required this.encounter,
    required this.challenge,
    super.isSuccess = false,
  });

  @override
  bool get isLair => false;
}

class LairEncounterResult extends EncounterResultBase {
  final LairEncounter encounter;
  final TenthFrameBowlingChallenge challenge;

  const LairEncounterResult({
    required super.game,
    required super.enounterLevel,
    super.strength,
    required this.encounter,
    required this.challenge,
    super.isSuccess = false,
  });

  @override
  bool get isLair => true;
}