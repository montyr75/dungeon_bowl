// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'active_character.dart';

class ActiveCharacterMapper extends ClassMapperBase<ActiveCharacter> {
  ActiveCharacterMapper._();

  static ActiveCharacterMapper? _instance;
  static ActiveCharacterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ActiveCharacterMapper._());
      CharacterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ActiveCharacter';

  static Character _$character(ActiveCharacter v) => v.character;
  static const Field<ActiveCharacter, Character> _f$character =
      Field('character', _$character);
  static int _$gp(ActiveCharacter v) => v.gp;
  static const Field<ActiveCharacter, int> _f$gp =
      Field('gp', _$gp, opt: true, def: 0);

  @override
  final MappableFields<ActiveCharacter> fields = const {
    #character: _f$character,
    #gp: _f$gp,
  };

  static ActiveCharacter _instantiate(DecodingData data) {
    return ActiveCharacter(
        character: data.dec(_f$character), gp: data.dec(_f$gp));
  }

  @override
  final Function instantiate = _instantiate;

  static ActiveCharacter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ActiveCharacter>(map);
  }

  static ActiveCharacter fromJson(String json) {
    return ensureInitialized().decodeJson<ActiveCharacter>(json);
  }
}

mixin ActiveCharacterMappable {
  String toJson() {
    return ActiveCharacterMapper.ensureInitialized()
        .encodeJson<ActiveCharacter>(this as ActiveCharacter);
  }

  Map<String, dynamic> toMap() {
    return ActiveCharacterMapper.ensureInitialized()
        .encodeMap<ActiveCharacter>(this as ActiveCharacter);
  }

  ActiveCharacterCopyWith<ActiveCharacter, ActiveCharacter, ActiveCharacter>
      get copyWith => _ActiveCharacterCopyWithImpl(
          this as ActiveCharacter, $identity, $identity);
  @override
  String toString() {
    return ActiveCharacterMapper.ensureInitialized()
        .stringifyValue(this as ActiveCharacter);
  }

  @override
  bool operator ==(Object other) {
    return ActiveCharacterMapper.ensureInitialized()
        .equalsValue(this as ActiveCharacter, other);
  }

  @override
  int get hashCode {
    return ActiveCharacterMapper.ensureInitialized()
        .hashValue(this as ActiveCharacter);
  }
}

extension ActiveCharacterValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ActiveCharacter, $Out> {
  ActiveCharacterCopyWith<$R, ActiveCharacter, $Out> get $asActiveCharacter =>
      $base.as((v, t, t2) => _ActiveCharacterCopyWithImpl(v, t, t2));
}

abstract class ActiveCharacterCopyWith<$R, $In extends ActiveCharacter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Character? character, int? gp});
  ActiveCharacterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ActiveCharacterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ActiveCharacter, $Out>
    implements ActiveCharacterCopyWith<$R, ActiveCharacter, $Out> {
  _ActiveCharacterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ActiveCharacter> $mapper =
      ActiveCharacterMapper.ensureInitialized();
  @override
  $R call({Character? character, int? gp}) => $apply(FieldCopyWithData(
      {if (character != null) #character: character, if (gp != null) #gp: gp}));
  @override
  ActiveCharacter $make(CopyWithData data) => ActiveCharacter(
      character: data.get(#character, or: $value.character),
      gp: data.get(#gp, or: $value.gp));

  @override
  ActiveCharacterCopyWith<$R2, ActiveCharacter, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ActiveCharacterCopyWithImpl($value, $cast, t);
}
