// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'bowler_levels.dart';

class BowlerLevelMapper extends EnumMapper<BowlerLevel> {
  BowlerLevelMapper._();

  static BowlerLevelMapper? _instance;
  static BowlerLevelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BowlerLevelMapper._());
    }
    return _instance!;
  }

  static BowlerLevel fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  BowlerLevel decode(dynamic value) {
    switch (value) {
      case 'novice':
        return BowlerLevel.novice;
      case 'beginner':
        return BowlerLevel.beginner;
      case 'intermediate':
        return BowlerLevel.intermediate;
      case 'proficient':
        return BowlerLevel.proficient;
      case 'advanced':
        return BowlerLevel.advanced;
      case 'pro':
        return BowlerLevel.pro;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(BowlerLevel self) {
    switch (self) {
      case BowlerLevel.novice:
        return 'novice';
      case BowlerLevel.beginner:
        return 'beginner';
      case BowlerLevel.intermediate:
        return 'intermediate';
      case BowlerLevel.proficient:
        return 'proficient';
      case BowlerLevel.advanced:
        return 'advanced';
      case BowlerLevel.pro:
        return 'pro';
    }
  }
}

extension BowlerLevelMapperExtension on BowlerLevel {
  String toValue() {
    BowlerLevelMapper.ensureInitialized();
    return MapperContainer.globals.toValue<BowlerLevel>(this) as String;
  }
}
