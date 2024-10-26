// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'saved_game.dart';

class SavedGameMapper extends ClassMapperBase<SavedGame> {
  SavedGameMapper._();

  static SavedGameMapper? _instance;
  static SavedGameMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SavedGameMapper._());
      AppStateMapper.ensureInitialized();
      GameStateMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SavedGame';

  static String _$version(SavedGame v) => v.version;
  static const Field<SavedGame, String> _f$version =
      Field('version', _$version);
  static DateTime _$timeStamp(SavedGame v) => v.timeStamp;
  static const Field<SavedGame, DateTime> _f$timeStamp =
      Field('timeStamp', _$timeStamp);
  static AppState _$appState(SavedGame v) => v.appState;
  static const Field<SavedGame, AppState> _f$appState =
      Field('appState', _$appState);
  static GameState _$gameState(SavedGame v) => v.gameState;
  static const Field<SavedGame, GameState> _f$gameState =
      Field('gameState', _$gameState);

  @override
  final MappableFields<SavedGame> fields = const {
    #version: _f$version,
    #timeStamp: _f$timeStamp,
    #appState: _f$appState,
    #gameState: _f$gameState,
  };

  static SavedGame _instantiate(DecodingData data) {
    return SavedGame(
        version: data.dec(_f$version),
        timeStamp: data.dec(_f$timeStamp),
        appState: data.dec(_f$appState),
        gameState: data.dec(_f$gameState));
  }

  @override
  final Function instantiate = _instantiate;

  static SavedGame fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SavedGame>(map);
  }

  static SavedGame fromJson(String json) {
    return ensureInitialized().decodeJson<SavedGame>(json);
  }
}

mixin SavedGameMappable {
  String toJson() {
    return SavedGameMapper.ensureInitialized()
        .encodeJson<SavedGame>(this as SavedGame);
  }

  Map<String, dynamic> toMap() {
    return SavedGameMapper.ensureInitialized()
        .encodeMap<SavedGame>(this as SavedGame);
  }

  SavedGameCopyWith<SavedGame, SavedGame, SavedGame> get copyWith =>
      _SavedGameCopyWithImpl(this as SavedGame, $identity, $identity);
  @override
  String toString() {
    return SavedGameMapper.ensureInitialized()
        .stringifyValue(this as SavedGame);
  }

  @override
  bool operator ==(Object other) {
    return SavedGameMapper.ensureInitialized()
        .equalsValue(this as SavedGame, other);
  }

  @override
  int get hashCode {
    return SavedGameMapper.ensureInitialized().hashValue(this as SavedGame);
  }
}

extension SavedGameValueCopy<$R, $Out> on ObjectCopyWith<$R, SavedGame, $Out> {
  SavedGameCopyWith<$R, SavedGame, $Out> get $asSavedGame =>
      $base.as((v, t, t2) => _SavedGameCopyWithImpl(v, t, t2));
}

abstract class SavedGameCopyWith<$R, $In extends SavedGame, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AppStateCopyWith<$R, AppState, AppState> get appState;
  GameStateCopyWith<$R, GameState, GameState> get gameState;
  $R call(
      {String? version,
      DateTime? timeStamp,
      AppState? appState,
      GameState? gameState});
  SavedGameCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SavedGameCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SavedGame, $Out>
    implements SavedGameCopyWith<$R, SavedGame, $Out> {
  _SavedGameCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SavedGame> $mapper =
      SavedGameMapper.ensureInitialized();
  @override
  AppStateCopyWith<$R, AppState, AppState> get appState =>
      $value.appState.copyWith.$chain((v) => call(appState: v));
  @override
  GameStateCopyWith<$R, GameState, GameState> get gameState =>
      $value.gameState.copyWith.$chain((v) => call(gameState: v));
  @override
  $R call(
          {String? version,
          DateTime? timeStamp,
          AppState? appState,
          GameState? gameState}) =>
      $apply(FieldCopyWithData({
        if (version != null) #version: version,
        if (timeStamp != null) #timeStamp: timeStamp,
        if (appState != null) #appState: appState,
        if (gameState != null) #gameState: gameState
      }));
  @override
  SavedGame $make(CopyWithData data) => SavedGame(
      version: data.get(#version, or: $value.version),
      timeStamp: data.get(#timeStamp, or: $value.timeStamp),
      appState: data.get(#appState, or: $value.appState),
      gameState: data.get(#gameState, or: $value.gameState));

  @override
  SavedGameCopyWith<$R2, SavedGame, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SavedGameCopyWithImpl($value, $cast, t);
}
