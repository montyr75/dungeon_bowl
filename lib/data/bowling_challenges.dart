import 'package:collection/collection.dart';

enum BowlingHit {
  strike,
  spare,
  min1,
  min;

  String toDisplay([int? strength]) {
    return switch (this) {
      BowlingHit.strike => "X",
      BowlingHit.spare => "/",
      BowlingHit.min1 => "1+",
      BowlingHit.min => "$strength+",
    };
  }
}

class BowlingChallenge {
  final int level;
  final bool isVariable; // does this challenge require a strength input?
  final BowlingHit? firstThrow;
  final BowlingHit? secondThrow;
  final BowlingHit? frameTotal;
  final String description;

  const BowlingChallenge({
    required this.level,
    this.isVariable = false,
    this.firstThrow,
    this.secondThrow,
    this.frameTotal,
    required this.description,
  });

  String toDisplay([int? strength]) {
    if (!isVariable) {
      return description;
    }

    assert(strength != null);

    return description.replaceAll("#", strength.toString());
  }
}

class TenthFrameBowlingChallenge extends BowlingChallenge {
  final BowlingHit? thirdThrow;

  const TenthFrameBowlingChallenge({
    required super.level,
    super.isVariable = false,
    super.firstThrow,
    super.secondThrow,
    this.thirdThrow,
    super.frameTotal,
    required super.description,
  });
}

/// There are 8 bowling challenges, corresponding to monster levels. A level 2 monster uses 1 or 2.
const bowlingChallenges = [
  BowlingChallenge(
    level: 1,
    firstThrow: BowlingHit.min1,
    description: "Hit at least 1 pin with the first throw.",
  ),
  BowlingChallenge(
    level: 2,
    firstThrow: BowlingHit.min1,
    secondThrow: BowlingHit.min1,
    description: "Hit at least 1 pin with each throw.",
  ),
  BowlingChallenge(
    level: 3,
    isVariable: true,
    frameTotal: BowlingHit.min,
    description: "Hit at least # total pins.",
  ),
  BowlingChallenge(
    level: 4,
    isVariable: true,
    firstThrow: BowlingHit.min,
    description: "Hit at least # pins with the first throw.",
  ),
  BowlingChallenge(
    level: 5,
    isVariable: true,
    firstThrow: BowlingHit.min,
    secondThrow: BowlingHit.min1,
    description: "Hit at least # pins with the first throw and at least 1 pin with the second throw.",
  ),
  BowlingChallenge(
    level: 6,
    secondThrow: BowlingHit.spare,
    description: "Get a spare.",
  ),
  BowlingChallenge(
    level: 7,
    isVariable: true,
    firstThrow: BowlingHit.min,
    secondThrow: BowlingHit.spare,
    description: "Hit at least # pins with the first throw and spare.",
  ),
  BowlingChallenge(
    level: 8,
    firstThrow: BowlingHit.strike,
    description: "Get a strike.",
  ),
];

extension ListBowlingChallegeX on List<BowlingChallenge> {
  BowlingChallenge? getByLevel(int lvl) => bowlingChallenges.firstWhereOrNull((value) => value.level == lvl);
}

const tenthFrameBowlingChallenges = [
  TenthFrameBowlingChallenge(
    level: 1,
    firstThrow: BowlingHit.min1,
    secondThrow: BowlingHit.min1,
    thirdThrow: BowlingHit.min1,
    description: "Hit at least 1 pin with every throw (including the third throw, if there is one).",
  ),
  TenthFrameBowlingChallenge(
    level: 2,
    isVariable: true,
    firstThrow: BowlingHit.min,
    description: "Hit at least # pins on the first throw.",
  ),
  TenthFrameBowlingChallenge(
    level: 3,
    secondThrow: BowlingHit.spare,
    description: "Get a spare on either the second or third throw.",
  ),
  TenthFrameBowlingChallenge(
    level: 4,
    isVariable: true,
    firstThrow: BowlingHit.min,
    secondThrow: BowlingHit.spare,
    description: "Hit at least # pins on the first throw and spare with the second or third throw.",
  ),
  TenthFrameBowlingChallenge(
    level: 5,
    isVariable: true,
    firstThrow: BowlingHit.min,
    secondThrow: BowlingHit.spare,
    thirdThrow: BowlingHit.min,
    description: "Hit at least # pins on the first throw, spare on the second throw, and hit at least # pins on the third throw.",
  ),
  TenthFrameBowlingChallenge(
    level: 6,
    firstThrow: BowlingHit.strike,
    description: "Get a strike with at least one throw.",
  ),
  TenthFrameBowlingChallenge(
    level: 7,
    firstThrow: BowlingHit.strike,
    secondThrow: BowlingHit.strike,
    description: "Get a strike with at least two throws.",
  ),
  TenthFrameBowlingChallenge(
    level: 8,
    firstThrow: BowlingHit.strike,
    secondThrow: BowlingHit.strike,
    thirdThrow: BowlingHit.strike,
    description: "Get a turkey (3 strikes).",
  ),
];

extension ListTenthFrameBowlingChallegeX on List<TenthFrameBowlingChallenge> {
  TenthFrameBowlingChallenge? getByLevel(int lvl) =>
      tenthFrameBowlingChallenges.firstWhereOrNull((value) => value.level == lvl);
}
