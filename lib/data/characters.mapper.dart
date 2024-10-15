// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'characters.dart';

class CharacterMapper extends EnumMapper<Character> {
  CharacterMapper._();

  static CharacterMapper? _instance;
  static CharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CharacterMapper._());
    }
    return _instance!;
  }

  static Character fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Character decode(dynamic value) {
    switch (value) {
      case 'sirBowlregard':
        return Character.sirBowlregard;
      case 'russellRollington':
        return Character.russellRollington;
      case 'saeraSparewynn':
        return Character.saeraSparewynn;
      case 'tylerTenpin':
        return Character.tylerTenpin;
      case 'kieranKillstrike':
        return Character.kieranKillstrike;
      case 'brieBrooklynshot':
        return Character.brieBrooklynshot;
      case 'elianaAnchorwell':
        return Character.elianaAnchorwell;
      case 'adalindAnchorwell':
        return Character.adalindAnchorwell;
      case 'inesLoftin':
        return Character.inesLoftin;
      case 'enriqueLoftin':
        return Character.enriqueLoftin;
      case 'amberArrowmark':
        return Character.amberArrowmark;
      case 'westonWarbowl':
        return Character.westonWarbowl;
      case 'tortyceTurkee':
        return Character.tortyceTurkee;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Character self) {
    switch (self) {
      case Character.sirBowlregard:
        return 'sirBowlregard';
      case Character.russellRollington:
        return 'russellRollington';
      case Character.saeraSparewynn:
        return 'saeraSparewynn';
      case Character.tylerTenpin:
        return 'tylerTenpin';
      case Character.kieranKillstrike:
        return 'kieranKillstrike';
      case Character.brieBrooklynshot:
        return 'brieBrooklynshot';
      case Character.elianaAnchorwell:
        return 'elianaAnchorwell';
      case Character.adalindAnchorwell:
        return 'adalindAnchorwell';
      case Character.inesLoftin:
        return 'inesLoftin';
      case Character.enriqueLoftin:
        return 'enriqueLoftin';
      case Character.amberArrowmark:
        return 'amberArrowmark';
      case Character.westonWarbowl:
        return 'westonWarbowl';
      case Character.tortyceTurkee:
        return 'tortyceTurkee';
    }
  }
}

extension CharacterMapperExtension on Character {
  String toValue() {
    CharacterMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Character>(this) as String;
  }
}
