
enum BowlingHit {
  strike,
  spare,
  min1,
  min;

  const BowlingHit();

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
  final bool isVariable; // does this challenge require a strength input?
  final BowlingHit? firstThrow;
  final BowlingHit? secondThrow;
  final BowlingHit? frameTotal;
  final String description;

  const BowlingChallenge({
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

/// There are 8 bowling challenges, corresponding to monster levels. A level 2 monster uses 1 or 2.
const bowlingChallenges = [
  BowlingChallenge(
    firstThrow: BowlingHit.min1,
    description: "Hit at least 1 pin with the first throw.",
  ),
  BowlingChallenge(
    firstThrow: BowlingHit.min1,
    secondThrow: BowlingHit.min1,
    description: "Hit at least 1 pin with each throw.",
  ),
  BowlingChallenge(
    isVariable: true,
    frameTotal: BowlingHit.min,
    description: "Hit at least # total pins.",
  ),
  BowlingChallenge(
    isVariable: true,
    firstThrow: BowlingHit.min,
    description: "Hit at least # pins with the first throw.",
  ),
  BowlingChallenge(
    isVariable: true,
    firstThrow: BowlingHit.min,
    secondThrow: BowlingHit.min1,
    description: "Hit at least # pins with the first throw and at least 1 pin with the second throw.",
  ),
  BowlingChallenge(
    firstThrow: BowlingHit.strike,
    secondThrow: BowlingHit.spare,
    description: "Strike or spare.",
  ),
  BowlingChallenge(
    isVariable: true,
    firstThrow: BowlingHit.min,
    secondThrow: BowlingHit.spare,
    description: "Hit at least # pins with the first throw and spare.",
  ),
  BowlingChallenge(
    firstThrow: BowlingHit.strike,
    description: "Strike.",
  ),
];
