import 'package:recase/recase.dart';

import '../utils/roller.dart';
import '../utils/utils.dart';
import 'bowler_levels.dart';
import 'bowling_challenges.dart';

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
  goblin(
    level: 3,
  ),
  wolf(
    level: 3,
  ),
  kobold(
    level: 4,
  ),
  zombie(
    level: 4,
  );

  final int level;

  const Encounter({
    required this.level,
  });

  BowlingChallenge generateChallenge(BowlerLevel bowlerLevel) {
    final challenges = bowlingChallenges.take(level).toList();
    final roll = rand(challenges.length) + bowlerLevel.challengeMod;

    return challenges[roll.maxOf(challenges.length)];
  }

  @override
  String toString() {
    return ReCase(name).titleCase;
  }
}
