// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lair_encounters.dart';

class LairEncounterMapper extends EnumMapper<LairEncounter> {
  LairEncounterMapper._();

  static LairEncounterMapper? _instance;
  static LairEncounterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LairEncounterMapper._());
    }
    return _instance!;
  }

  static LairEncounter fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  LairEncounter decode(dynamic value) {
    switch (value) {
      case 'chimera':
        return LairEncounter.chimera;
      case 'madDwarf':
        return LairEncounter.madDwarf;
      case 'orcs':
        return LairEncounter.orcs;
      case 'wyvern':
        return LairEncounter.wyvern;
      case 'cyclops':
        return LairEncounter.cyclops;
      case 'mage':
        return LairEncounter.mage;
      case 'stoneGolem':
        return LairEncounter.stoneGolem;
      case 'unicorn':
        return LairEncounter.unicorn;
      case 'hydra':
        return LairEncounter.hydra;
      case 'medusa':
        return LairEncounter.medusa;
      case 'mummy':
        return LairEncounter.mummy;
      case 'tyrannosaurusRex':
        return LairEncounter.tyrannosaurusRex;
      case 'blackDragon':
        return LairEncounter.blackDragon;
      case 'fireDemon':
        return LairEncounter.fireDemon;
      case 'lich':
        return LairEncounter.lich;
      case 'vampire':
        return LairEncounter.vampire;
      case 'archmage':
        return LairEncounter.archmage;
      case 'dracolich':
        return LairEncounter.dracolich;
      case 'killerBunny':
        return LairEncounter.killerBunny;
      case 'purpleWorm':
        return LairEncounter.purpleWorm;
      case 'strikeDragon':
        return LairEncounter.strikeDragon;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(LairEncounter self) {
    switch (self) {
      case LairEncounter.chimera:
        return 'chimera';
      case LairEncounter.madDwarf:
        return 'madDwarf';
      case LairEncounter.orcs:
        return 'orcs';
      case LairEncounter.wyvern:
        return 'wyvern';
      case LairEncounter.cyclops:
        return 'cyclops';
      case LairEncounter.mage:
        return 'mage';
      case LairEncounter.stoneGolem:
        return 'stoneGolem';
      case LairEncounter.unicorn:
        return 'unicorn';
      case LairEncounter.hydra:
        return 'hydra';
      case LairEncounter.medusa:
        return 'medusa';
      case LairEncounter.mummy:
        return 'mummy';
      case LairEncounter.tyrannosaurusRex:
        return 'tyrannosaurusRex';
      case LairEncounter.blackDragon:
        return 'blackDragon';
      case LairEncounter.fireDemon:
        return 'fireDemon';
      case LairEncounter.lich:
        return 'lich';
      case LairEncounter.vampire:
        return 'vampire';
      case LairEncounter.archmage:
        return 'archmage';
      case LairEncounter.dracolich:
        return 'dracolich';
      case LairEncounter.killerBunny:
        return 'killerBunny';
      case LairEncounter.purpleWorm:
        return 'purpleWorm';
      case LairEncounter.strikeDragon:
        return 'strikeDragon';
    }
  }
}

extension LairEncounterMapperExtension on LairEncounter {
  String toValue() {
    LairEncounterMapper.ensureInitialized();
    return MapperContainer.globals.toValue<LairEncounter>(this) as String;
  }
}
