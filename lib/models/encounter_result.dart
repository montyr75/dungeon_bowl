import 'package:dart_mappable/dart_mappable.dart';

import '../data/bowling_challenges.dart';
import '../data/encounters.dart';
import '../data/lair_encounters.dart';
import 'frame.dart';

part 'encounter_result.mapper.dart';

@MappableClass()
abstract class EncounterResultBase with EncounterResultBaseMappable {
  final int game;
  final int frame;
  final int encounterLevel;
  final int? strength;
  final Frame frameData;
  final bool isSuccess;

  const EncounterResultBase({
    required this.game,
    required this.frame,
    required this.encounterLevel,
    this.strength,
    required this.frameData,
    this.isSuccess = false,
  });

  bool get isLair;
  bool get isFailure => !isSuccess;
}

@MappableClass()
class EncounterResult extends EncounterResultBase with EncounterResultMappable {
  final Encounter encounter;
  final BowlingChallenge challenge;

  const EncounterResult({
    required super.game,
    required super.frame,
    required super.encounterLevel,
    super.strength,
    required this.encounter,
    required this.challenge,
    required super.frameData,
    super.isSuccess = false,
  });

  @override
  bool get isLair => false;
}

@MappableClass()
class BossLairEncounterResult extends EncounterResultBase with BossLairEncounterResultMappable {
  final LairEncounter encounter;
  final TenthFrameBowlingChallenge challenge;

  const BossLairEncounterResult({
    required super.game,
    required super.frame,
    required super.encounterLevel,
    super.strength,
    required this.encounter,
    required this.challenge,
    required super.frameData,
    super.isSuccess = false,
  });

  @override
  bool get isLair => true;
}

@MappableClass()
class LairEncounterResult extends EncounterResultBase with LairEncounterResultMappable {
  final LairEncounter encounter;
  final BowlingChallenge challenge1;
  final BowlingChallenge challenge2;

  const LairEncounterResult({
    required super.game,
    required super.frame,
    required super.encounterLevel,
    super.strength,
    required this.encounter,
    required this.challenge1,
    required this.challenge2,
    required super.frameData,
    super.isSuccess = false,
  });

  @override
  bool get isLair => true;
}