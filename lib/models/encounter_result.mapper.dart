// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'encounter_result.dart';

class EncounterResultBaseMapper extends ClassMapperBase<EncounterResultBase> {
  EncounterResultBaseMapper._();

  static EncounterResultBaseMapper? _instance;
  static EncounterResultBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EncounterResultBaseMapper._());
      EncounterResultMapper.ensureInitialized();
      LairEncounterResultMapper.ensureInitialized();
      FoundLairEncounterResultMapper.ensureInitialized();
      FrameMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EncounterResultBase';

  static int _$game(EncounterResultBase v) => v.game;
  static const Field<EncounterResultBase, int> _f$game = Field('game', _$game);
  static int _$frame(EncounterResultBase v) => v.frame;
  static const Field<EncounterResultBase, int> _f$frame =
      Field('frame', _$frame);
  static int _$encounterLevel(EncounterResultBase v) => v.encounterLevel;
  static const Field<EncounterResultBase, int> _f$encounterLevel =
      Field('encounterLevel', _$encounterLevel);
  static int? _$strength(EncounterResultBase v) => v.strength;
  static const Field<EncounterResultBase, int> _f$strength =
      Field('strength', _$strength, opt: true);
  static Frame _$frameData(EncounterResultBase v) => v.frameData;
  static const Field<EncounterResultBase, Frame> _f$frameData =
      Field('frameData', _$frameData);
  static bool _$isSuccess(EncounterResultBase v) => v.isSuccess;
  static const Field<EncounterResultBase, bool> _f$isSuccess =
      Field('isSuccess', _$isSuccess, opt: true, def: false);

  @override
  final MappableFields<EncounterResultBase> fields = const {
    #game: _f$game,
    #frame: _f$frame,
    #encounterLevel: _f$encounterLevel,
    #strength: _f$strength,
    #frameData: _f$frameData,
    #isSuccess: _f$isSuccess,
  };

  static EncounterResultBase _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('EncounterResultBase');
  }

  @override
  final Function instantiate = _instantiate;

  static EncounterResultBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EncounterResultBase>(map);
  }

  static EncounterResultBase fromJson(String json) {
    return ensureInitialized().decodeJson<EncounterResultBase>(json);
  }
}

mixin EncounterResultBaseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  EncounterResultBaseCopyWith<EncounterResultBase, EncounterResultBase,
      EncounterResultBase> get copyWith;
}

abstract class EncounterResultBaseCopyWith<$R, $In extends EncounterResultBase,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  FrameCopyWith<$R, Frame, Frame> get frameData;
  $R call(
      {int? game,
      int? frame,
      int? encounterLevel,
      int? strength,
      Frame? frameData,
      bool? isSuccess});
  EncounterResultBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class EncounterResultMapper extends ClassMapperBase<EncounterResult> {
  EncounterResultMapper._();

  static EncounterResultMapper? _instance;
  static EncounterResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EncounterResultMapper._());
      EncounterResultBaseMapper.ensureInitialized();
      EncounterMapper.ensureInitialized();
      BowlingChallengeMapper.ensureInitialized();
      FrameMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EncounterResult';

  static int _$game(EncounterResult v) => v.game;
  static const Field<EncounterResult, int> _f$game = Field('game', _$game);
  static int _$frame(EncounterResult v) => v.frame;
  static const Field<EncounterResult, int> _f$frame = Field('frame', _$frame);
  static int _$encounterLevel(EncounterResult v) => v.encounterLevel;
  static const Field<EncounterResult, int> _f$encounterLevel =
      Field('encounterLevel', _$encounterLevel);
  static int? _$strength(EncounterResult v) => v.strength;
  static const Field<EncounterResult, int> _f$strength =
      Field('strength', _$strength, opt: true);
  static Encounter _$encounter(EncounterResult v) => v.encounter;
  static const Field<EncounterResult, Encounter> _f$encounter =
      Field('encounter', _$encounter);
  static BowlingChallenge _$challenge(EncounterResult v) => v.challenge;
  static const Field<EncounterResult, BowlingChallenge> _f$challenge =
      Field('challenge', _$challenge);
  static Frame _$frameData(EncounterResult v) => v.frameData;
  static const Field<EncounterResult, Frame> _f$frameData =
      Field('frameData', _$frameData);
  static bool _$isSuccess(EncounterResult v) => v.isSuccess;
  static const Field<EncounterResult, bool> _f$isSuccess =
      Field('isSuccess', _$isSuccess, opt: true, def: false);

  @override
  final MappableFields<EncounterResult> fields = const {
    #game: _f$game,
    #frame: _f$frame,
    #encounterLevel: _f$encounterLevel,
    #strength: _f$strength,
    #encounter: _f$encounter,
    #challenge: _f$challenge,
    #frameData: _f$frameData,
    #isSuccess: _f$isSuccess,
  };

  static EncounterResult _instantiate(DecodingData data) {
    return EncounterResult(
        game: data.dec(_f$game),
        frame: data.dec(_f$frame),
        encounterLevel: data.dec(_f$encounterLevel),
        strength: data.dec(_f$strength),
        encounter: data.dec(_f$encounter),
        challenge: data.dec(_f$challenge),
        frameData: data.dec(_f$frameData),
        isSuccess: data.dec(_f$isSuccess));
  }

  @override
  final Function instantiate = _instantiate;

  static EncounterResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EncounterResult>(map);
  }

  static EncounterResult fromJson(String json) {
    return ensureInitialized().decodeJson<EncounterResult>(json);
  }
}

mixin EncounterResultMappable {
  String toJson() {
    return EncounterResultMapper.ensureInitialized()
        .encodeJson<EncounterResult>(this as EncounterResult);
  }

  Map<String, dynamic> toMap() {
    return EncounterResultMapper.ensureInitialized()
        .encodeMap<EncounterResult>(this as EncounterResult);
  }

  EncounterResultCopyWith<EncounterResult, EncounterResult, EncounterResult>
      get copyWith => _EncounterResultCopyWithImpl(
          this as EncounterResult, $identity, $identity);
  @override
  String toString() {
    return EncounterResultMapper.ensureInitialized()
        .stringifyValue(this as EncounterResult);
  }

  @override
  bool operator ==(Object other) {
    return EncounterResultMapper.ensureInitialized()
        .equalsValue(this as EncounterResult, other);
  }

  @override
  int get hashCode {
    return EncounterResultMapper.ensureInitialized()
        .hashValue(this as EncounterResult);
  }
}

extension EncounterResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EncounterResult, $Out> {
  EncounterResultCopyWith<$R, EncounterResult, $Out> get $asEncounterResult =>
      $base.as((v, t, t2) => _EncounterResultCopyWithImpl(v, t, t2));
}

abstract class EncounterResultCopyWith<$R, $In extends EncounterResult, $Out>
    implements EncounterResultBaseCopyWith<$R, $In, $Out> {
  BowlingChallengeCopyWith<$R, BowlingChallenge, BowlingChallenge>
      get challenge;
  @override
  FrameCopyWith<$R, Frame, Frame> get frameData;
  @override
  $R call(
      {int? game,
      int? frame,
      int? encounterLevel,
      int? strength,
      Encounter? encounter,
      BowlingChallenge? challenge,
      Frame? frameData,
      bool? isSuccess});
  EncounterResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _EncounterResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EncounterResult, $Out>
    implements EncounterResultCopyWith<$R, EncounterResult, $Out> {
  _EncounterResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EncounterResult> $mapper =
      EncounterResultMapper.ensureInitialized();
  @override
  BowlingChallengeCopyWith<$R, BowlingChallenge, BowlingChallenge>
      get challenge =>
          $value.challenge.copyWith.$chain((v) => call(challenge: v));
  @override
  FrameCopyWith<$R, Frame, Frame> get frameData =>
      $value.frameData.copyWith.$chain((v) => call(frameData: v));
  @override
  $R call(
          {int? game,
          int? frame,
          int? encounterLevel,
          Object? strength = $none,
          Encounter? encounter,
          BowlingChallenge? challenge,
          Frame? frameData,
          bool? isSuccess}) =>
      $apply(FieldCopyWithData({
        if (game != null) #game: game,
        if (frame != null) #frame: frame,
        if (encounterLevel != null) #encounterLevel: encounterLevel,
        if (strength != $none) #strength: strength,
        if (encounter != null) #encounter: encounter,
        if (challenge != null) #challenge: challenge,
        if (frameData != null) #frameData: frameData,
        if (isSuccess != null) #isSuccess: isSuccess
      }));
  @override
  EncounterResult $make(CopyWithData data) => EncounterResult(
      game: data.get(#game, or: $value.game),
      frame: data.get(#frame, or: $value.frame),
      encounterLevel: data.get(#encounterLevel, or: $value.encounterLevel),
      strength: data.get(#strength, or: $value.strength),
      encounter: data.get(#encounter, or: $value.encounter),
      challenge: data.get(#challenge, or: $value.challenge),
      frameData: data.get(#frameData, or: $value.frameData),
      isSuccess: data.get(#isSuccess, or: $value.isSuccess));

  @override
  EncounterResultCopyWith<$R2, EncounterResult, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EncounterResultCopyWithImpl($value, $cast, t);
}

class LairEncounterResultMapper extends ClassMapperBase<LairEncounterResult> {
  LairEncounterResultMapper._();

  static LairEncounterResultMapper? _instance;
  static LairEncounterResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LairEncounterResultMapper._());
      EncounterResultBaseMapper.ensureInitialized();
      TenthFrameBowlingChallengeMapper.ensureInitialized();
      FrameMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LairEncounterResult';

  static int _$game(LairEncounterResult v) => v.game;
  static const Field<LairEncounterResult, int> _f$game = Field('game', _$game);
  static int _$frame(LairEncounterResult v) => v.frame;
  static const Field<LairEncounterResult, int> _f$frame =
      Field('frame', _$frame);
  static int _$encounterLevel(LairEncounterResult v) => v.encounterLevel;
  static const Field<LairEncounterResult, int> _f$encounterLevel =
      Field('encounterLevel', _$encounterLevel);
  static int? _$strength(LairEncounterResult v) => v.strength;
  static const Field<LairEncounterResult, int> _f$strength =
      Field('strength', _$strength, opt: true);
  static LairEncounter _$encounter(LairEncounterResult v) => v.encounter;
  static const Field<LairEncounterResult, LairEncounter> _f$encounter =
      Field('encounter', _$encounter);
  static TenthFrameBowlingChallenge _$challenge(LairEncounterResult v) =>
      v.challenge;
  static const Field<LairEncounterResult, TenthFrameBowlingChallenge>
      _f$challenge = Field('challenge', _$challenge);
  static Frame _$frameData(LairEncounterResult v) => v.frameData;
  static const Field<LairEncounterResult, Frame> _f$frameData =
      Field('frameData', _$frameData);
  static bool _$isSuccess(LairEncounterResult v) => v.isSuccess;
  static const Field<LairEncounterResult, bool> _f$isSuccess =
      Field('isSuccess', _$isSuccess, opt: true, def: false);

  @override
  final MappableFields<LairEncounterResult> fields = const {
    #game: _f$game,
    #frame: _f$frame,
    #encounterLevel: _f$encounterLevel,
    #strength: _f$strength,
    #encounter: _f$encounter,
    #challenge: _f$challenge,
    #frameData: _f$frameData,
    #isSuccess: _f$isSuccess,
  };

  static LairEncounterResult _instantiate(DecodingData data) {
    return LairEncounterResult(
        game: data.dec(_f$game),
        frame: data.dec(_f$frame),
        encounterLevel: data.dec(_f$encounterLevel),
        strength: data.dec(_f$strength),
        encounter: data.dec(_f$encounter),
        challenge: data.dec(_f$challenge),
        frameData: data.dec(_f$frameData),
        isSuccess: data.dec(_f$isSuccess));
  }

  @override
  final Function instantiate = _instantiate;

  static LairEncounterResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LairEncounterResult>(map);
  }

  static LairEncounterResult fromJson(String json) {
    return ensureInitialized().decodeJson<LairEncounterResult>(json);
  }
}

mixin LairEncounterResultMappable {
  String toJson() {
    return LairEncounterResultMapper.ensureInitialized()
        .encodeJson<LairEncounterResult>(this as LairEncounterResult);
  }

  Map<String, dynamic> toMap() {
    return LairEncounterResultMapper.ensureInitialized()
        .encodeMap<LairEncounterResult>(this as LairEncounterResult);
  }

  LairEncounterResultCopyWith<LairEncounterResult, LairEncounterResult,
          LairEncounterResult>
      get copyWith => _LairEncounterResultCopyWithImpl(
          this as LairEncounterResult, $identity, $identity);
  @override
  String toString() {
    return LairEncounterResultMapper.ensureInitialized()
        .stringifyValue(this as LairEncounterResult);
  }

  @override
  bool operator ==(Object other) {
    return LairEncounterResultMapper.ensureInitialized()
        .equalsValue(this as LairEncounterResult, other);
  }

  @override
  int get hashCode {
    return LairEncounterResultMapper.ensureInitialized()
        .hashValue(this as LairEncounterResult);
  }
}

extension LairEncounterResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LairEncounterResult, $Out> {
  LairEncounterResultCopyWith<$R, LairEncounterResult, $Out>
      get $asLairEncounterResult =>
          $base.as((v, t, t2) => _LairEncounterResultCopyWithImpl(v, t, t2));
}

abstract class LairEncounterResultCopyWith<$R, $In extends LairEncounterResult,
    $Out> implements EncounterResultBaseCopyWith<$R, $In, $Out> {
  TenthFrameBowlingChallengeCopyWith<$R, TenthFrameBowlingChallenge,
      TenthFrameBowlingChallenge> get challenge;
  @override
  FrameCopyWith<$R, Frame, Frame> get frameData;
  @override
  $R call(
      {int? game,
      int? frame,
      int? encounterLevel,
      int? strength,
      LairEncounter? encounter,
      TenthFrameBowlingChallenge? challenge,
      Frame? frameData,
      bool? isSuccess});
  LairEncounterResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LairEncounterResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LairEncounterResult, $Out>
    implements LairEncounterResultCopyWith<$R, LairEncounterResult, $Out> {
  _LairEncounterResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LairEncounterResult> $mapper =
      LairEncounterResultMapper.ensureInitialized();
  @override
  TenthFrameBowlingChallengeCopyWith<$R, TenthFrameBowlingChallenge,
          TenthFrameBowlingChallenge>
      get challenge =>
          $value.challenge.copyWith.$chain((v) => call(challenge: v));
  @override
  FrameCopyWith<$R, Frame, Frame> get frameData =>
      $value.frameData.copyWith.$chain((v) => call(frameData: v));
  @override
  $R call(
          {int? game,
          int? frame,
          int? encounterLevel,
          Object? strength = $none,
          LairEncounter? encounter,
          TenthFrameBowlingChallenge? challenge,
          Frame? frameData,
          bool? isSuccess}) =>
      $apply(FieldCopyWithData({
        if (game != null) #game: game,
        if (frame != null) #frame: frame,
        if (encounterLevel != null) #encounterLevel: encounterLevel,
        if (strength != $none) #strength: strength,
        if (encounter != null) #encounter: encounter,
        if (challenge != null) #challenge: challenge,
        if (frameData != null) #frameData: frameData,
        if (isSuccess != null) #isSuccess: isSuccess
      }));
  @override
  LairEncounterResult $make(CopyWithData data) => LairEncounterResult(
      game: data.get(#game, or: $value.game),
      frame: data.get(#frame, or: $value.frame),
      encounterLevel: data.get(#encounterLevel, or: $value.encounterLevel),
      strength: data.get(#strength, or: $value.strength),
      encounter: data.get(#encounter, or: $value.encounter),
      challenge: data.get(#challenge, or: $value.challenge),
      frameData: data.get(#frameData, or: $value.frameData),
      isSuccess: data.get(#isSuccess, or: $value.isSuccess));

  @override
  LairEncounterResultCopyWith<$R2, LairEncounterResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LairEncounterResultCopyWithImpl($value, $cast, t);
}

class FoundLairEncounterResultMapper
    extends ClassMapperBase<FoundLairEncounterResult> {
  FoundLairEncounterResultMapper._();

  static FoundLairEncounterResultMapper? _instance;
  static FoundLairEncounterResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FoundLairEncounterResultMapper._());
      EncounterResultBaseMapper.ensureInitialized();
      BowlingChallengeMapper.ensureInitialized();
      FrameMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FoundLairEncounterResult';

  static int _$game(FoundLairEncounterResult v) => v.game;
  static const Field<FoundLairEncounterResult, int> _f$game =
      Field('game', _$game);
  static int _$frame(FoundLairEncounterResult v) => v.frame;
  static const Field<FoundLairEncounterResult, int> _f$frame =
      Field('frame', _$frame);
  static int _$encounterLevel(FoundLairEncounterResult v) => v.encounterLevel;
  static const Field<FoundLairEncounterResult, int> _f$encounterLevel =
      Field('encounterLevel', _$encounterLevel);
  static int? _$strength(FoundLairEncounterResult v) => v.strength;
  static const Field<FoundLairEncounterResult, int> _f$strength =
      Field('strength', _$strength, opt: true);
  static LairEncounter _$encounter(FoundLairEncounterResult v) => v.encounter;
  static const Field<FoundLairEncounterResult, LairEncounter> _f$encounter =
      Field('encounter', _$encounter);
  static BowlingChallenge _$challenge1(FoundLairEncounterResult v) =>
      v.challenge1;
  static const Field<FoundLairEncounterResult, BowlingChallenge> _f$challenge1 =
      Field('challenge1', _$challenge1);
  static BowlingChallenge _$challenge2(FoundLairEncounterResult v) =>
      v.challenge2;
  static const Field<FoundLairEncounterResult, BowlingChallenge> _f$challenge2 =
      Field('challenge2', _$challenge2);
  static Frame _$frameData(FoundLairEncounterResult v) => v.frameData;
  static const Field<FoundLairEncounterResult, Frame> _f$frameData =
      Field('frameData', _$frameData);
  static bool _$isSuccess(FoundLairEncounterResult v) => v.isSuccess;
  static const Field<FoundLairEncounterResult, bool> _f$isSuccess =
      Field('isSuccess', _$isSuccess, opt: true, def: false);

  @override
  final MappableFields<FoundLairEncounterResult> fields = const {
    #game: _f$game,
    #frame: _f$frame,
    #encounterLevel: _f$encounterLevel,
    #strength: _f$strength,
    #encounter: _f$encounter,
    #challenge1: _f$challenge1,
    #challenge2: _f$challenge2,
    #frameData: _f$frameData,
    #isSuccess: _f$isSuccess,
  };

  static FoundLairEncounterResult _instantiate(DecodingData data) {
    return FoundLairEncounterResult(
        game: data.dec(_f$game),
        frame: data.dec(_f$frame),
        encounterLevel: data.dec(_f$encounterLevel),
        strength: data.dec(_f$strength),
        encounter: data.dec(_f$encounter),
        challenge1: data.dec(_f$challenge1),
        challenge2: data.dec(_f$challenge2),
        frameData: data.dec(_f$frameData),
        isSuccess: data.dec(_f$isSuccess));
  }

  @override
  final Function instantiate = _instantiate;

  static FoundLairEncounterResult fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FoundLairEncounterResult>(map);
  }

  static FoundLairEncounterResult fromJson(String json) {
    return ensureInitialized().decodeJson<FoundLairEncounterResult>(json);
  }
}

mixin FoundLairEncounterResultMappable {
  String toJson() {
    return FoundLairEncounterResultMapper.ensureInitialized()
        .encodeJson<FoundLairEncounterResult>(this as FoundLairEncounterResult);
  }

  Map<String, dynamic> toMap() {
    return FoundLairEncounterResultMapper.ensureInitialized()
        .encodeMap<FoundLairEncounterResult>(this as FoundLairEncounterResult);
  }

  FoundLairEncounterResultCopyWith<FoundLairEncounterResult,
          FoundLairEncounterResult, FoundLairEncounterResult>
      get copyWith => _FoundLairEncounterResultCopyWithImpl(
          this as FoundLairEncounterResult, $identity, $identity);
  @override
  String toString() {
    return FoundLairEncounterResultMapper.ensureInitialized()
        .stringifyValue(this as FoundLairEncounterResult);
  }

  @override
  bool operator ==(Object other) {
    return FoundLairEncounterResultMapper.ensureInitialized()
        .equalsValue(this as FoundLairEncounterResult, other);
  }

  @override
  int get hashCode {
    return FoundLairEncounterResultMapper.ensureInitialized()
        .hashValue(this as FoundLairEncounterResult);
  }
}

extension FoundLairEncounterResultValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FoundLairEncounterResult, $Out> {
  FoundLairEncounterResultCopyWith<$R, FoundLairEncounterResult, $Out>
      get $asFoundLairEncounterResult => $base
          .as((v, t, t2) => _FoundLairEncounterResultCopyWithImpl(v, t, t2));
}

abstract class FoundLairEncounterResultCopyWith<
    $R,
    $In extends FoundLairEncounterResult,
    $Out> implements EncounterResultBaseCopyWith<$R, $In, $Out> {
  BowlingChallengeCopyWith<$R, BowlingChallenge, BowlingChallenge>
      get challenge1;
  BowlingChallengeCopyWith<$R, BowlingChallenge, BowlingChallenge>
      get challenge2;
  @override
  FrameCopyWith<$R, Frame, Frame> get frameData;
  @override
  $R call(
      {int? game,
      int? frame,
      int? encounterLevel,
      int? strength,
      LairEncounter? encounter,
      BowlingChallenge? challenge1,
      BowlingChallenge? challenge2,
      Frame? frameData,
      bool? isSuccess});
  FoundLairEncounterResultCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FoundLairEncounterResultCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FoundLairEncounterResult, $Out>
    implements
        FoundLairEncounterResultCopyWith<$R, FoundLairEncounterResult, $Out> {
  _FoundLairEncounterResultCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FoundLairEncounterResult> $mapper =
      FoundLairEncounterResultMapper.ensureInitialized();
  @override
  BowlingChallengeCopyWith<$R, BowlingChallenge, BowlingChallenge>
      get challenge1 =>
          $value.challenge1.copyWith.$chain((v) => call(challenge1: v));
  @override
  BowlingChallengeCopyWith<$R, BowlingChallenge, BowlingChallenge>
      get challenge2 =>
          $value.challenge2.copyWith.$chain((v) => call(challenge2: v));
  @override
  FrameCopyWith<$R, Frame, Frame> get frameData =>
      $value.frameData.copyWith.$chain((v) => call(frameData: v));
  @override
  $R call(
          {int? game,
          int? frame,
          int? encounterLevel,
          Object? strength = $none,
          LairEncounter? encounter,
          BowlingChallenge? challenge1,
          BowlingChallenge? challenge2,
          Frame? frameData,
          bool? isSuccess}) =>
      $apply(FieldCopyWithData({
        if (game != null) #game: game,
        if (frame != null) #frame: frame,
        if (encounterLevel != null) #encounterLevel: encounterLevel,
        if (strength != $none) #strength: strength,
        if (encounter != null) #encounter: encounter,
        if (challenge1 != null) #challenge1: challenge1,
        if (challenge2 != null) #challenge2: challenge2,
        if (frameData != null) #frameData: frameData,
        if (isSuccess != null) #isSuccess: isSuccess
      }));
  @override
  FoundLairEncounterResult $make(CopyWithData data) => FoundLairEncounterResult(
      game: data.get(#game, or: $value.game),
      frame: data.get(#frame, or: $value.frame),
      encounterLevel: data.get(#encounterLevel, or: $value.encounterLevel),
      strength: data.get(#strength, or: $value.strength),
      encounter: data.get(#encounter, or: $value.encounter),
      challenge1: data.get(#challenge1, or: $value.challenge1),
      challenge2: data.get(#challenge2, or: $value.challenge2),
      frameData: data.get(#frameData, or: $value.frameData),
      isSuccess: data.get(#isSuccess, or: $value.isSuccess));

  @override
  FoundLairEncounterResultCopyWith<$R2, FoundLairEncounterResult, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FoundLairEncounterResultCopyWithImpl($value, $cast, t);
}
