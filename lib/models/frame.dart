import 'package:quiver/core.dart' show Optional;

class Frame {
  final int? firstThrow;
  final int? secondThrow;
  final int? score;

  const Frame({
    this.firstThrow,
    this.secondThrow,
    this.score,
  });

  Frame copyWith({
    Optional<int>? firstThrow,
    Optional<int>? secondThrow,
    Optional<int>? score,
  }) {
    return Frame(
      firstThrow: firstThrow == null ? this.firstThrow : firstThrow.orNull,
      secondThrow: secondThrow == null ? this.secondThrow : secondThrow.orNull,
      score: score == null ? this.score : score.orNull,
    );
  }

  bool get isStrike => (firstThrow ?? 0) == 10;
  bool get isSpare => (firstThrow ?? 0) + (secondThrow ?? 0) == 10;
  bool get isOpen => !isStrike && !isSpare;

  int? get currentThrow {
    if (firstThrow == null) {
      return 1;
    }

    if (secondThrow == null && !isStrike) {
      return 2;
    }

    return null;
  }
}