import 'package:dart_mappable/dart_mappable.dart';

import '../data/characters.dart';
import '../data/treasure.dart';

part 'active_character.mapper.dart';

@MappableClass()
class ActiveCharacter with ActiveCharacterMappable {
  final Character character;
  final int gp;
  final List<Treasure> inventory;

  ActiveCharacter({
    required this.character,
    this.gp = 0,
    this.inventory = const [],
  });

  ActiveCharacter addTreasure(Treasure treasure) {
    if (treasure.isMoney) {
      return copyWith(gp: gp + treasure.value);
    }

    return copyWith(
      inventory: List.unmodifiable(
        inventory.toList()..add(treasure),
      ),
    );
  }

  static const fromMap = ActiveCharacterMapper.fromMap;
  static const fromJson = ActiveCharacterMapper.fromJson;
}
