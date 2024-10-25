// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'app_state.dart';

class AppStateMapper extends ClassMapperBase<AppState> {
  AppStateMapper._();

  static AppStateMapper? _instance;
  static AppStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AppStateMapper._());
      BowlerLevelMapper.ensureInitialized();
      CharacterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AppState';

  static BowlerLevel _$bowlerLevel(AppState v) => v.bowlerLevel;
  static const Field<AppState, BowlerLevel> _f$bowlerLevel =
      Field('bowlerLevel', _$bowlerLevel, opt: true, def: BowlerLevel.beginner);
  static Character? _$character(AppState v) => v.character;
  static const Field<AppState, Character> _f$character =
      Field('character', _$character, opt: true);

  @override
  final MappableFields<AppState> fields = const {
    #bowlerLevel: _f$bowlerLevel,
    #character: _f$character,
  };

  static AppState _instantiate(DecodingData data) {
    return AppState(
        bowlerLevel: data.dec(_f$bowlerLevel),
        character: data.dec(_f$character));
  }

  @override
  final Function instantiate = _instantiate;

  static AppState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AppState>(map);
  }

  static AppState fromJson(String json) {
    return ensureInitialized().decodeJson<AppState>(json);
  }
}

mixin AppStateMappable {
  String toJson() {
    return AppStateMapper.ensureInitialized()
        .encodeJson<AppState>(this as AppState);
  }

  Map<String, dynamic> toMap() {
    return AppStateMapper.ensureInitialized()
        .encodeMap<AppState>(this as AppState);
  }

  AppStateCopyWith<AppState, AppState, AppState> get copyWith =>
      _AppStateCopyWithImpl(this as AppState, $identity, $identity);
  @override
  String toString() {
    return AppStateMapper.ensureInitialized().stringifyValue(this as AppState);
  }

  @override
  bool operator ==(Object other) {
    return AppStateMapper.ensureInitialized()
        .equalsValue(this as AppState, other);
  }

  @override
  int get hashCode {
    return AppStateMapper.ensureInitialized().hashValue(this as AppState);
  }
}

extension AppStateValueCopy<$R, $Out> on ObjectCopyWith<$R, AppState, $Out> {
  AppStateCopyWith<$R, AppState, $Out> get $asAppState =>
      $base.as((v, t, t2) => _AppStateCopyWithImpl(v, t, t2));
}

abstract class AppStateCopyWith<$R, $In extends AppState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({BowlerLevel? bowlerLevel, Character? character});
  AppStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AppStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AppState, $Out>
    implements AppStateCopyWith<$R, AppState, $Out> {
  _AppStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AppState> $mapper =
      AppStateMapper.ensureInitialized();
  @override
  $R call({BowlerLevel? bowlerLevel, Object? character = $none}) =>
      $apply(FieldCopyWithData({
        if (bowlerLevel != null) #bowlerLevel: bowlerLevel,
        if (character != $none) #character: character
      }));
  @override
  AppState $make(CopyWithData data) => AppState(
      bowlerLevel: data.get(#bowlerLevel, or: $value.bowlerLevel),
      character: data.get(#character, or: $value.character));

  @override
  AppStateCopyWith<$R2, AppState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AppStateCopyWithImpl($value, $cast, t);
}
