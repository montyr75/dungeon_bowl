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
  tylerTenpin(
    race: 'Half-Orc',
    profession: 'Brawler',
    description: '',
  ),
  brieBrooklynshot(
    race: 'Tabaxi',
    profession: 'Rogue',
    description: '',
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
