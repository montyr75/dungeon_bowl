import 'package:recase/recase.dart';


enum Encounter {
  bat(
    level: 1,
  ),
  giantBeetle(
    level: 1,
  ),
  rat(
    level: 1,
  ),
  snake(
    level: 1,
  ),
  bandit(
    level: 2,
  ),
  giantLizard(
    level: 2,
  ),
  giantRat(
    level: 2,
  ),
  skeleton(
    level: 2,
  ),
  goblins(
    level: 3,
  ),
  wolf(
    level: 3,
  ),
  kobolds(
    level: 4,
  ),
  orc(
    level: 4,
  ),
  zombie(
    level: 4,
  ),
  harpy(
    level: 5,
  ),
  ogre(
    level: 5,
  ),
  wererat(
    level: 5,
  ),
  basilisk(
    level: 6,
  ),
  minotaur(
    level: 6,
  ),
  owlbear(
    level: 6,
  ),
  ghost(
    level: 7,
  ),
  succubusDemon(
    level: 7,
  ),
  troll(
    level: 7,
  ),
  frostGiant(
    level: 8,
  ),
  wraith(
    level: 8,
  );

  final int level;

  const Encounter({
    required this.level,
  });

  static Encounter randomEncounterByLevel(int lvl) {
    final list = Encounter.values.where((value) => value.level == lvl).toList()..shuffle();
    return list.first;
  }

  @override
  String toString() {
    return ReCase(name).titleCase;
  }
}
