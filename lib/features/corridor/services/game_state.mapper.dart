// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'game_state.dart';

class GameStateMapper extends ClassMapperBase<GameState> {
  GameStateMapper._();

  static GameStateMapper? _instance;
  static GameStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameStateMapper._());
      ActiveCharacterMapper.ensureInitialized();
      EncounterResultBaseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameState';

  static ActiveCharacter _$character(GameState v) => v.character;
  static const Field<GameState, ActiveCharacter> _f$character =
      Field('character', _$character);
  static int _$game(GameState v) => v.game;
  static const Field<GameState, int> _f$game =
      Field('game', _$game, opt: true, def: 1);
  static int _$frame(GameState v) => v.frame;
  static const Field<GameState, int> _f$frame =
      Field('frame', _$frame, opt: true, def: 1);
  static List<EncounterResultBase> _$encounterHistory(GameState v) =>
      v.encounterHistory;
  static const Field<GameState, List<EncounterResultBase>> _f$encounterHistory =
      Field('encounterHistory', _$encounterHistory, opt: true, def: const []);

  @override
  final MappableFields<GameState> fields = const {
    #character: _f$character,
    #game: _f$game,
    #frame: _f$frame,
    #encounterHistory: _f$encounterHistory,
  };

  static GameState _instantiate(DecodingData data) {
    return GameState(
        character: data.dec(_f$character),
        game: data.dec(_f$game),
        frame: data.dec(_f$frame),
        encounterHistory: data.dec(_f$encounterHistory));
  }

  @override
  final Function instantiate = _instantiate;

  static GameState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameState>(map);
  }

  static GameState fromJson(String json) {
    return ensureInitialized().decodeJson<GameState>(json);
  }
}

mixin GameStateMappable {
  String toJson() {
    return GameStateMapper.ensureInitialized()
        .encodeJson<GameState>(this as GameState);
  }

  Map<String, dynamic> toMap() {
    return GameStateMapper.ensureInitialized()
        .encodeMap<GameState>(this as GameState);
  }

  GameStateCopyWith<GameState, GameState, GameState> get copyWith =>
      _GameStateCopyWithImpl(this as GameState, $identity, $identity);
  @override
  String toString() {
    return GameStateMapper.ensureInitialized()
        .stringifyValue(this as GameState);
  }

  @override
  bool operator ==(Object other) {
    return GameStateMapper.ensureInitialized()
        .equalsValue(this as GameState, other);
  }

  @override
  int get hashCode {
    return GameStateMapper.ensureInitialized().hashValue(this as GameState);
  }
}

extension GameStateValueCopy<$R, $Out> on ObjectCopyWith<$R, GameState, $Out> {
  GameStateCopyWith<$R, GameState, $Out> get $asGameState =>
      $base.as((v, t, t2) => _GameStateCopyWithImpl(v, t, t2));
}

abstract class GameStateCopyWith<$R, $In extends GameState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ActiveCharacterCopyWith<$R, ActiveCharacter, ActiveCharacter> get character;
  ListCopyWith<$R, EncounterResultBase,
          ObjectCopyWith<$R, EncounterResultBase, EncounterResultBase>>
      get encounterHistory;
  $R call(
      {ActiveCharacter? character,
      int? game,
      int? frame,
      List<EncounterResultBase>? encounterHistory});
  GameStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameState, $Out>
    implements GameStateCopyWith<$R, GameState, $Out> {
  _GameStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameState> $mapper =
      GameStateMapper.ensureInitialized();
  @override
  ActiveCharacterCopyWith<$R, ActiveCharacter, ActiveCharacter> get character =>
      $value.character.copyWith.$chain((v) => call(character: v));
  @override
  ListCopyWith<$R, EncounterResultBase,
          ObjectCopyWith<$R, EncounterResultBase, EncounterResultBase>>
      get encounterHistory => ListCopyWith(
          $value.encounterHistory,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(encounterHistory: v));
  @override
  $R call(
          {ActiveCharacter? character,
          int? game,
          int? frame,
          List<EncounterResultBase>? encounterHistory}) =>
      $apply(FieldCopyWithData({
        if (character != null) #character: character,
        if (game != null) #game: game,
        if (frame != null) #frame: frame,
        if (encounterHistory != null) #encounterHistory: encounterHistory
      }));
  @override
  GameState $make(CopyWithData data) => GameState(
      character: data.get(#character, or: $value.character),
      game: data.get(#game, or: $value.game),
      frame: data.get(#frame, or: $value.frame),
      encounterHistory:
          data.get(#encounterHistory, or: $value.encounterHistory));

  @override
  GameStateCopyWith<$R2, GameState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameStateCopyWithImpl($value, $cast, t);
}
