import 'package:dart_mappable/dart_mappable.dart';

import '../data/characters.dart';

part 'active_character.mapper.dart';

@MappableClass()
class ActiveCharacter with ActiveCharacterMappable {
  final Character character;
  final int gp;

  ActiveCharacter({
    required this.character,
    this.gp = 0,
  });

  static const fromMap = ActiveCharacterMapper.fromMap;
  static const fromJson = ActiveCharacterMapper.fromJson;
}
