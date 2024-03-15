import 'package:recase/recase.dart';

const characterImagePath = 'assets/images/characters';

enum Character {
  sirBowlregard(
    race: 'Human',
    profession: 'Knight',
    description: '',
  ),
  russellRollington(
    race: 'Gnome',
    profession: 'Artificer',
    description: '',
  ),
  saeraSparewynn(
    race: 'Elf',
    profession: 'Ranger',
    description: '',
  ),
  tylerTenpin(
    race: 'Half-Orc',
    profession: 'Brawler',
    description: '',
  ),
  kieranKillstrike(
    race: 'Aasimar',
    profession: 'Paladin',
    description: '',
  ),
  brieBrooklynshot(
    race: 'Tabaxi',
    profession: 'Rogue',
    description: 'Hailing from a faraway continent, Brie Brooklynshot is on a mission of revenge, searching for the dark wizard who killed her parents for their valuable pelts and left her for dead.',
  );

  final String race;
  final String profession;
  final String description;

  const Character({
    required this.race,
    required this.profession,
    required this.description,
  });

  @override
  String toString() => ReCase(name).titleCase;

  String get imagePath => "$characterImagePath/${ReCase(name).snakeCase}.webp";
}
