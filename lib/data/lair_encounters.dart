import 'package:recase/recase.dart';

const lairEncounterImagePath = 'assets/images/lair_encounters';

enum LairEncounter {
  orcs(
    level: 4,
    description: "This group of orcs has carved out a home here in the dungeon, and they are ready to attack any who threaten their reign.",
  ),
  chimera(
    level: 4,
    description: "The chimera is a horrid combination of goat, lion, and dragon, and it delights in swooping out of the sky to burn alive its prey with its fiery breath.",
  ),
  unicorn(
    level: 5,
    description: "You must convince this majestic, magical creature that your cause is good. If you succeed, it will let you pass.",
  ),
  mage(
    level: 5,
    description: "Dominating this area of the dungeon with fearsome magic, this mage is furious at you for interrupting his studies.",
  ),
  hydra(
    level: 6,
    description: "This five-headed, snake-like horror has an endless appetite. In the absence of prey, the heads may even turn on each other, with the creature regenerating any that are severed.",
  ),
  tyrannosaurusRex(
    level: 6,
    description: "With its mighty jaws and lashing tail, this dinosaur is always looking for a meal, and its hunger is never sated. Run.",
  ),
  blackDragon(
    level: 7,
    description: "This creature thrives in moisture, lairing in swampy environs, surrounded by the partially-dissolved remains of victims of its acid breath.",
  ),
  lich(
    level: 7,
    description: "Evil wizards who can't bear the thought of dying use malign magic to thwart death, continuing on this plane in the form of an undead lich. This lich will not let you stand in its way.",
  ),
  strikeDragon(
    level: 8,
    description: "Though not technically a dragon, this towering beast wields the elemental might of lightning, using it to strike entire groups of foes, and leaving nothing but charred and stinking devastation in its wake.",
  ),
  killerBunny(
    level: 8,
    description: "Don't be fooled! This rabbit is dynamite. It will do more than nibble your bum. It can leap great distances to decapitate an enemy with a single mighty chomp, and it has a very foul temper.",
  );

  final int level;
  final String description;

  const LairEncounter({
    required this.level,
    required this.description,
  });

  static LairEncounter randomEncounterByLevel(int lvl) {
    final list = LairEncounter.values.where((value) => value.level == lvl).toList()..shuffle();
    return list.first;
  }

  @override
  String toString() {
    return ReCase(name).titleCase;
  }

  String get imageFile => "${ReCase(name).snakeCase}.webp";
  String get imagePath => "$lairEncounterImagePath/$imageFile";
}
