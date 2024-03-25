import 'package:recase/recase.dart';

const characterImagePath = 'assets/images/characters';
const characterBgImagePath = 'assets/images/characters/backgrounds';

enum Character {
  sirBowlregard(
    race: 'Human',
    profession: 'Knight',
    description: 'Eager to claim his place in the annals of history, Sir Bowlregard treks far and wide, boldly facing danger, protecting the innocent and weak, and conquering evil.',
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
    description: 'Practically raised in the arena, addicted to the roar of the crowd and the attention of his adoring fans, Tyler seeks fame, glory, and riches, and nothing will stand in his way.',
  ),
  kieranKillstrike(
    race: 'Aasimar',
    profession: 'Paladin',
    description: '',
  ),
  brieBrooklynshot(
    race: 'Tabaxi',
    profession: 'Rogue',
    description:
        'Hailing from a faraway continent, Brie is on a mission of revenge, searching for the dark wizard who killed her parents for their valuable pelts and left her for dead.',
  ),
  amberArrowmark(
    race: 'Half-Elf',
    profession: 'Druid',
    description: 'Outcast from both human and elven communities, Amber has made her home deep in the forest among her only true friends, the animals of the wild.',
  ),
  westonWarbowl(
    race: 'Elf',
    profession: 'Fighter',
    description: "Trained from birth as a soldier, Weston is sworn to protect his elven nation. If that means a sojourn to dangerous lands to eliminate evil's source, so be it.",
  ),
  tortyceTurkee(
    race: 'Tortle',
    profession: 'Cleric',
    description: "A devout disciple of the god of light, dawn, and new beginnings, Tortyce quests for justice. If he happens to come upon some treasure, the church could always use a donation.",
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

  String get imageFile => "${ReCase(name).snakeCase}.webp";
  String get imagePath => "$characterImagePath/$imageFile";
  String get bgImagePath => "$characterBgImagePath/$imageFile";
}
