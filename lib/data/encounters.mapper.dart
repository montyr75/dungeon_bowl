// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'encounters.dart';

class EncounterMapper extends EnumMapper<Encounter> {
  EncounterMapper._();

  static EncounterMapper? _instance;
  static EncounterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EncounterMapper._());
    }
    return _instance!;
  }

  static Encounter fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Encounter decode(dynamic value) {
    switch (value) {
      case 'bat':
        return Encounter.bat;
      case 'giantBeetle':
        return Encounter.giantBeetle;
      case 'rat':
        return Encounter.rat;
      case 'snake':
        return Encounter.snake;
      case 'theLog':
        return Encounter.theLog;
      case 'bandit':
        return Encounter.bandit;
      case 'giantLizard':
        return Encounter.giantLizard;
      case 'giantRat':
        return Encounter.giantRat;
      case 'giantSpider':
        return Encounter.giantSpider;
      case 'skeleton':
        return Encounter.skeleton;
      case 'troglodyte':
        return Encounter.troglodyte;
      case 'breakawayFloor':
        return Encounter.breakawayFloor;
      case 'goblins':
        return Encounter.goblins;
      case 'greenSlime':
        return Encounter.greenSlime;
      case 'grungs':
        return Encounter.grungs;
      case 'unicornFoal':
        return Encounter.unicornFoal;
      case 'web':
        return Encounter.web;
      case 'wolf':
        return Encounter.wolf;
      case 'bugbear':
        return Encounter.bugbear;
      case 'kobolds':
        return Encounter.kobolds;
      case 'hellHound':
        return Encounter.hellHound;
      case 'hobgoblin':
        return Encounter.hobgoblin;
      case 'orc':
        return Encounter.orc;
      case 'zombie':
        return Encounter.zombie;
      case 'creepingDeath':
        return Encounter.creepingDeath;
      case 'gelatinousCube':
        return Encounter.gelatinousCube;
      case 'gargoyle':
        return Encounter.gargoyle;
      case 'harpy':
        return Encounter.harpy;
      case 'ogre':
        return Encounter.ogre;
      case 'pitDoor':
        return Encounter.pitDoor;
      case 'wererat':
        return Encounter.wererat;
      case 'undeadKnight':
        return Encounter.undeadKnight;
      case 'airElemental':
        return Encounter.airElemental;
      case 'basilisk':
        return Encounter.basilisk;
      case 'caged':
        return Encounter.caged;
      case 'giantCrocodile':
        return Encounter.giantCrocodile;
      case 'manticore':
        return Encounter.manticore;
      case 'minotaur':
        return Encounter.minotaur;
      case 'owlbear':
        return Encounter.owlbear;
      case 'waterElemental':
        return Encounter.waterElemental;
      case 'earthElemental':
        return Encounter.earthElemental;
      case 'ghost':
        return Encounter.ghost;
      case 'strikers':
        return Encounter.strikers;
      case 'succubusDemon':
        return Encounter.succubusDemon;
      case 'troll':
        return Encounter.troll;
      case 'hornedDevils':
        return Encounter.hornedDevils;
      case 'darkElfMage':
        return Encounter.darkElfMage;
      case 'fleshGolem':
        return Encounter.fleshGolem;
      case 'frostGiant':
        return Encounter.frostGiant;
      case 'nightHag':
        return Encounter.nightHag;
      case 'roomOfBlades':
        return Encounter.roomOfBlades;
      case 'wraith':
        return Encounter.wraith;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Encounter self) {
    switch (self) {
      case Encounter.bat:
        return 'bat';
      case Encounter.giantBeetle:
        return 'giantBeetle';
      case Encounter.rat:
        return 'rat';
      case Encounter.snake:
        return 'snake';
      case Encounter.theLog:
        return 'theLog';
      case Encounter.bandit:
        return 'bandit';
      case Encounter.giantLizard:
        return 'giantLizard';
      case Encounter.giantRat:
        return 'giantRat';
      case Encounter.giantSpider:
        return 'giantSpider';
      case Encounter.skeleton:
        return 'skeleton';
      case Encounter.troglodyte:
        return 'troglodyte';
      case Encounter.breakawayFloor:
        return 'breakawayFloor';
      case Encounter.goblins:
        return 'goblins';
      case Encounter.greenSlime:
        return 'greenSlime';
      case Encounter.grungs:
        return 'grungs';
      case Encounter.unicornFoal:
        return 'unicornFoal';
      case Encounter.web:
        return 'web';
      case Encounter.wolf:
        return 'wolf';
      case Encounter.bugbear:
        return 'bugbear';
      case Encounter.kobolds:
        return 'kobolds';
      case Encounter.hellHound:
        return 'hellHound';
      case Encounter.hobgoblin:
        return 'hobgoblin';
      case Encounter.orc:
        return 'orc';
      case Encounter.zombie:
        return 'zombie';
      case Encounter.creepingDeath:
        return 'creepingDeath';
      case Encounter.gelatinousCube:
        return 'gelatinousCube';
      case Encounter.gargoyle:
        return 'gargoyle';
      case Encounter.harpy:
        return 'harpy';
      case Encounter.ogre:
        return 'ogre';
      case Encounter.pitDoor:
        return 'pitDoor';
      case Encounter.wererat:
        return 'wererat';
      case Encounter.undeadKnight:
        return 'undeadKnight';
      case Encounter.airElemental:
        return 'airElemental';
      case Encounter.basilisk:
        return 'basilisk';
      case Encounter.caged:
        return 'caged';
      case Encounter.giantCrocodile:
        return 'giantCrocodile';
      case Encounter.manticore:
        return 'manticore';
      case Encounter.minotaur:
        return 'minotaur';
      case Encounter.owlbear:
        return 'owlbear';
      case Encounter.waterElemental:
        return 'waterElemental';
      case Encounter.earthElemental:
        return 'earthElemental';
      case Encounter.ghost:
        return 'ghost';
      case Encounter.strikers:
        return 'strikers';
      case Encounter.succubusDemon:
        return 'succubusDemon';
      case Encounter.troll:
        return 'troll';
      case Encounter.hornedDevils:
        return 'hornedDevils';
      case Encounter.darkElfMage:
        return 'darkElfMage';
      case Encounter.fleshGolem:
        return 'fleshGolem';
      case Encounter.frostGiant:
        return 'frostGiant';
      case Encounter.nightHag:
        return 'nightHag';
      case Encounter.roomOfBlades:
        return 'roomOfBlades';
      case Encounter.wraith:
        return 'wraith';
    }
  }
}

extension EncounterMapperExtension on Encounter {
  String toValue() {
    EncounterMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Encounter>(this) as String;
  }
}
