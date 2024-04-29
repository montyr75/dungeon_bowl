import '../data/bowling_challenges.dart';
import '../data/encounters.dart';
import '../data/lair_encounters.dart';
import 'frame.dart';

abstract class EncounterResultBase {
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

  EncounterResultBase copyWith({
    int? game,
    int? frame,
    int? encounterLevel,
    int? strength,
    Frame? frameData,
    bool? isSuccess,
  });
}

class EncounterResult extends EncounterResultBase {
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

  @override
  EncounterResult copyWith({
    int? game,
    int? frame,
    int? encounterLevel,
    int? strength,
    Frame? frameData,
    bool? isSuccess,
    Encounter? encounter,
    BowlingChallenge? challenge,
  }) {
    return EncounterResult(
      game: game ?? this.game,
      frame: frame ?? this.frame,
      encounterLevel: encounterLevel ?? this.encounterLevel,
      strength: strength ?? this.strength,
      frameData: frameData ?? this.frameData,
      isSuccess: isSuccess ?? this.isSuccess,
      encounter: encounter ?? this.encounter,
      challenge: challenge ?? this.challenge,
    );
  }
}

class LairEncounterResult extends EncounterResultBase {
  final LairEncounter encounter;
  final TenthFrameBowlingChallenge challenge;

  const LairEncounterResult({
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

  @override
  LairEncounterResult copyWith({
    int? game,
    int? frame,
    int? encounterLevel,
    int? strength,
    Frame? frameData,
    bool? isSuccess,
    LairEncounter? encounter,
    TenthFrameBowlingChallenge? challenge,
  }) {
    return LairEncounterResult(
      game: game ?? this.game,
      frame: frame ?? this.frame,
      encounterLevel: encounterLevel ?? this.encounterLevel,
      strength: strength ?? this.strength,
      frameData: frameData ?? this.frameData,
      isSuccess: isSuccess ?? this.isSuccess,
      encounter: encounter ?? this.encounter,
      challenge: challenge ?? this.challenge,
    );
  }
}

class FoundLairEncounterResult extends EncounterResultBase {
  final LairEncounter encounter;
  final BowlingChallenge challenge1;
  final BowlingChallenge challenge2;

  const FoundLairEncounterResult({
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

  @override
  FoundLairEncounterResult copyWith({
    int? game,
    int? frame,
    int? encounterLevel,
    int? strength,
    Frame? frameData,
    bool? isSuccess,
    LairEncounter? encounter,
    BowlingChallenge? challenge1,
    BowlingChallenge? challenge2,
  }) {
    return FoundLairEncounterResult(
      game: game ?? this.game,
      frame: frame ?? this.frame,
      encounterLevel: encounterLevel ?? this.encounterLevel,
      strength: strength ?? this.strength,
      frameData: frameData ?? this.frameData,
      isSuccess: isSuccess ?? this.isSuccess,
      encounter: encounter ?? this.encounter,
      challenge1: challenge1 ?? this.challenge1,
      challenge2: challenge2 ?? this.challenge2,
    );
  }
}