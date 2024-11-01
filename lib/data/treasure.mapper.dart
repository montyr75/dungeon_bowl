// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'treasure.dart';

class FrequencyMapper extends EnumMapper<Frequency> {
  FrequencyMapper._();

  static FrequencyMapper? _instance;
  static FrequencyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FrequencyMapper._());
    }
    return _instance!;
  }

  static Frequency fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Frequency decode(dynamic value) {
    switch (value) {
      case 'common':
        return Frequency.common;
      case 'uncommon':
        return Frequency.uncommon;
      case 'rare':
        return Frequency.rare;
      case 'veryRare':
        return Frequency.veryRare;
      case 'legendary':
        return Frequency.legendary;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Frequency self) {
    switch (self) {
      case Frequency.common:
        return 'common';
      case Frequency.uncommon:
        return 'uncommon';
      case Frequency.rare:
        return 'rare';
      case Frequency.veryRare:
        return 'veryRare';
      case Frequency.legendary:
        return 'legendary';
    }
  }
}

extension FrequencyMapperExtension on Frequency {
  String toValue() {
    FrequencyMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Frequency>(this) as String;
  }
}

class TreasureTypeMapper extends EnumMapper<TreasureType> {
  TreasureTypeMapper._();

  static TreasureTypeMapper? _instance;
  static TreasureTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TreasureTypeMapper._());
    }
    return _instance!;
  }

  static TreasureType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TreasureType decode(dynamic value) {
    switch (value) {
      case 'money':
        return TreasureType.money;
      case 'item':
        return TreasureType.item;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TreasureType self) {
    switch (self) {
      case TreasureType.money:
        return 'money';
      case TreasureType.item:
        return 'item';
    }
  }
}

extension TreasureTypeMapperExtension on TreasureType {
  String toValue() {
    TreasureTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TreasureType>(this) as String;
  }
}

class TreasureMapper extends EnumMapper<Treasure> {
  TreasureMapper._();

  static TreasureMapper? _instance;
  static TreasureMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TreasureMapper._());
    }
    return _instance!;
  }

  static Treasure fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Treasure decode(dynamic value) {
    switch (value) {
      case 'charmOfSerendipity':
        return Treasure.charmOfSerendipity;
      case 'gemOfAnnihilation':
        return Treasure.gemOfAnnihilation;
      case 'goldCoin1':
        return Treasure.goldCoin1;
      case 'goldCoin2':
        return Treasure.goldCoin2;
      case 'goldCoin3':
        return Treasure.goldCoin3;
      case 'goldCoin4':
        return Treasure.goldCoin4;
      case 'goldCoin5':
        return Treasure.goldCoin5;
      case 'hatOfDoom':
        return Treasure.hatOfDoom;
      case 'luckyCharm':
        return Treasure.luckyCharm;
      case 'magicSword':
        return Treasure.magicSword;
      case 'ringOfInvisibility':
        return Treasure.ringOfInvisibility;
      case 'ringOfTeleportation':
        return Treasure.ringOfTeleportation;
      case 'rodOfPersuasion':
        return Treasure.rodOfPersuasion;
      case 'shadowDagger':
        return Treasure.shadowDagger;
      case 'shrinkingSpell':
        return Treasure.shrinkingSpell;
      case 'survivalTools':
        return Treasure.survivalTools;
      case 'vorpalBlade':
        return Treasure.vorpalBlade;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Treasure self) {
    switch (self) {
      case Treasure.charmOfSerendipity:
        return 'charmOfSerendipity';
      case Treasure.gemOfAnnihilation:
        return 'gemOfAnnihilation';
      case Treasure.goldCoin1:
        return 'goldCoin1';
      case Treasure.goldCoin2:
        return 'goldCoin2';
      case Treasure.goldCoin3:
        return 'goldCoin3';
      case Treasure.goldCoin4:
        return 'goldCoin4';
      case Treasure.goldCoin5:
        return 'goldCoin5';
      case Treasure.hatOfDoom:
        return 'hatOfDoom';
      case Treasure.luckyCharm:
        return 'luckyCharm';
      case Treasure.magicSword:
        return 'magicSword';
      case Treasure.ringOfInvisibility:
        return 'ringOfInvisibility';
      case Treasure.ringOfTeleportation:
        return 'ringOfTeleportation';
      case Treasure.rodOfPersuasion:
        return 'rodOfPersuasion';
      case Treasure.shadowDagger:
        return 'shadowDagger';
      case Treasure.shrinkingSpell:
        return 'shrinkingSpell';
      case Treasure.survivalTools:
        return 'survivalTools';
      case Treasure.vorpalBlade:
        return 'vorpalBlade';
    }
  }
}

extension TreasureMapperExtension on Treasure {
  String toValue() {
    TreasureMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Treasure>(this) as String;
  }
}
