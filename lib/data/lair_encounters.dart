import 'package:recase/recase.dart';

const lairEncounterImagePath = 'assets/images/lair_encounters';

enum LairEncounter {
  chimera(
    level: 4,
    description: "The chimera is a horrid combination of goat, lion, and dragon, and it delights in swooping out of the sky to burn alive its prey with its fiery breath.",
  ),
  madDwarf(
    level: 4,
    description: "A crazy-eyed dwarf confronts you before this locked door, babbling about a magic key. You'll have to convince him to reveal the key's location to get through.",
  ),
  orcs(
    level: 4,
    description: "This group of orcs has carved out a home here in the dungeon, and they are ready to attack any who threaten their reign.",
  ),
  wyvern(
    level: 4,
    description: "Cousin to dragons, this fearsome, nearly mindless beast crouches in wait for its next meal to appear.",
  ),
  cyclops(
    level: 5,
    description: "Not too bright, but huge and aggressive, this cyclops roars and charges the moment it sets its eye on you.",
  ),
  mage(
    level: 5,
    description: "Dominating this area of the dungeon with fearsome magic, this mage is furious at you for interrupting his studies.",
  ),
  stoneGolem(
    level: 5,
    description: "This massive, daunting, walking statue slowly turns its attention toward you, then pulls back a huge fist, preparing to mash you into pulp.",
  ),
  unicorn(
    level: 5,
    description: "You must convince this majestic, magical creature that your cause is good. If you succeed, it will let you pass.",
  ),
  hydra(
    level: 6,
    description: "This five-headed, snake-like horror has an endless appetite. In the absence of prey, the heads may even turn on each other, with the creature regenerating any that are severed.",
  ),
  medusa(
    level: 6,
    description: "A terrible curse twisted this woman into a horrid, serpent-haired menace who turns her victims to stone with her powerful gaze. Don't look at her!",
  ),
  mummy(
    level: 6,
    description: "When its rest is disturbed, an undead mummy will not stop until its blood lust is sated, and it's damn near indestructible.",
  ),
  tyrannosaurusRex(
    level: 6,
    description: "With its mighty jaws and lashing tail, this dinosaur is always looking for a meal, and its hunger is never sated. Run.",
  ),
  blackDragon(
    level: 7,
    description: "This creature thrives in moisture, lairing in swampy environs, surrounded by the partially dissolved remains of victims of its acid breath.",
  ),
  fireDemon(
    level: 7,
    description: "Summoned here against his will, this fire demon will burn down the world to get back to his demonic armies.",
  ),
  lich(
    level: 7,
    description: "Evil wizards who can't bear the thought of dying use malign magic to thwart death, continuing on this plane in the form of an undead lich. This lich will not let you stand in its way.",
  ),
  vampire(
    level: 7,
    description: "Vampires are formidable spellcasters and shapeshifters, and irredeemably evil. Do not succumb to her seductive charms, lest you end up her eternal servant.",
  ),
  archmage(
    level: 8,
    description: "There is almost nothing more dangerous than an archmage in his prime. He finishes off another enemy with a fiery burst of magic, then turns to you.",
  ),
  killerBunny(
    level: 8,
    description: "Don't be fooled! This rabbit is dynamite. It will do more than nibble your bum. It can leap great distances to decapitate an enemy with a single mighty chomp, and it has a very foul temper.",
  ),
  purpleWorm(
    level: 8,
    description: "Able to chew through solid rock as it burrows through the stony depths, this massive, mindless worm will eat anything in its path.",
  ),
  strikeDragon(
    level: 8,
    description: "Though not technically a dragon, this towering beast wields the elemental might of lightning, using it to strike entire groups of foes, leaving nothing but charred and stinking devastation in its wake.",
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
