import 'package:recase/recase.dart';

const encounterImagePath = 'assets/images/encounters';

enum Encounter {
  bat(
    level: 1,
    description: "A bat! A bat out of hell, that is. What has this thing been eating?",
  ),
  giantBeetle(
    level: 1,
    description: "Beetles just get scarier and scarier the bigger they get. This one seems to believe you're not welcome here.",
  ),
  rat(
    level: 1,
    description: "There's something about this dungeon that brings out the worst in normally innocuous animals. You don't want to be bitten by this rat.",
  ),
  snake(
    level: 1,
    description: "This snake looks like it's going to enjoy snacking on you. Aim for the head!",
  ),
  bandit(
    level: 2,
    description: "You can't trust anyone these days! This bandit wants all the treasure she can carry, and all that you're carrying.",
  ),
  giantLizard(
    level: 2,
    description: "Leaping lizards! This thing is out for blood, and it won't stop until it gets yours.",
  ),
  giantRat(
    level: 2,
    description: "Don't be fooled by this rat's calm demeanor. It will defend its refuse pile with deadly intent.",
  ),
  skeleton(
    level: 2,
    description: "Sometimes the dead don't stay dead. This undead horror aims to add your skull to its collection.",
  ),
  goblins(
    level: 3,
    description: "Despite being bipeds, make no mistake that goblins are vermin. Evil to the core, they love taking prisoners and torturing them to death for their own amusement.",
  ),
  wolf(
    level: 3,
    description: "Hostile and hungry, this wolf is looking for its next meal, and you make a convenient morsel.",
  ),
  kobolds(
    level: 4,
    description: "Sneaky, tricky, and wicked, this group of kobolds will work together to bring you down, assuming you don't spring one of their traps first.",
  ),
  orc(
    level: 4,
    description: "Orcs are ugly, brutish, and savage creatures who will kill you for sport. This one has its eye on you.",
  ),
  zombie(
    level: 4,
    description: "The zombie shambles toward you with the terrible determination of the undead the moment you enter the room, oozing flesh and viscera dripping from its bones. The stench alone may defeat you.",
  ),
  gelatinousCube(
    level: 5,
    description: "A nearly transparent cube of ooze, the gelatinous cube scoots through dungeons, digesting the flesh of its victims, then expelling bones and steel undissolved.",
  ),
  harpy(
    level: 5,
    description: "Born in an unholy magical ritual gone awry, the harpy is angry and jealous. She can't wait to tear out your throat with her sharp talons.",
  ),
  ogre(
    level: 5,
    description: "As you enter, this giant, muscle-bound beast looks up, and its eyes immediately fill with rage. With a snarl, it grabs the nearest chair to throw at you, temporarily forgetting its weapons in its furious tantrum.",
  ),
  wererat(
    level: 5,
    description: "Stricken with lycanthropy through the bite of another wererat, this creature is forever cursed to live part of its life as human, part as giant rat, and part as a horrifying hybrid.",
  ),
  basilisk(
    level: 6,
    description: "When the eyes of this gigantic lizard begin to glow, turn and run, else you'll be turned to stone and added to its collection of sorrowful statues.",
  ),
  minotaur(
    level: 6,
    description: "This massive, bull-headed humanoid bellows to the ceiling, lifts its mighty axe, and charges toward you.",
  ),
  owlbear(
    level: 6,
    description: "Created by sinister magic thousands of years ago, owlbears have managed to proliferate in the wild. This one appears ready to defend its nest at all costs.",
  ),
  earthElemental(
    level: 7,
    description: "Native to the earth plane, earth elementals are creatures of dirt and stone. Fighting one is like fighting a small mountain.",
  ),
  ghost(
    level: 7,
    description: "A soul bound to haunt this area, never at rest, always bent on destruction in a vain attempt to alleviate its desperate longing, this ghost is not to be trifled with.",
  ),
  strikers(
    level: 7,
    description: "Mysterious dragon-kin crackling with the essence of lightning, strikers hunt in packs of three. Their claws and jaws deliver powerful electric shocks, simultaneously cooking and killing their prey.",
  ),
  succubusDemon(
    level: 7,
    description: "A formidable foe, the succubus exists only to tempt, seduce, and ultimately devour the souls of her victims, dragging their life essence to the underworld to feed even less savory beings.",
  ),
  troll(
    level: 7,
    description: "Tall, gangly, and uncannily powerful, trolls move with frightening speed to rend flesh, delighting in the screams of agony from their victims.",
  ),
  fleshGolem(
    level: 8,
    description: "A disgusting magical construct built from the flesh, bones, and sinew of various humanoids, this flesh golem only has one goal: kill.",
  ),
  frostGiant(
    level: 8,
    description: "The frost giant is a huge creature of ice and snow, its flesh a glacial blue-white. It has made a wintry home here in the dungeon. Its eyes narrow and its mouth arcs into an angry frown, then it attacks!",
  ),
  wraith(
    level: 8,
    description: "The undead wraith embodies death and darkness. It hates all living things with a blinding passion. Smoky arms extended, it moves to drain your very life force to feed its insatiable hunger.",
  );

  final int level;
  final String description;

  const Encounter({
    required this.level,
    required this.description,
  });

  static Encounter randomEncounterByLevel(int lvl) {
    final list = Encounter.values.where((value) => value.level == lvl).toList()..shuffle();
    return list.first;
  }

  @override
  String toString() {
    return ReCase(name).titleCase;
  }

  String get imageFile => "${ReCase(name).snakeCase}.webp";
  String get imagePath => "$encounterImagePath/$imageFile";
}
