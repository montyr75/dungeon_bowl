import 'package:dartx/dartx.dart';
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
  bool get isComplete => isStrike || firstThrow != null && secondThrow != null;

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

class TenthFrame extends Frame {
  final int? thirdThrow;

  const TenthFrame({
    super.firstThrow,
    super.secondThrow,
    this.thirdThrow,
    super.score,
  });

  @override
  TenthFrame copyWith({
    Optional<int>? firstThrow,
    Optional<int>? secondThrow,
    Optional<int>? thirdThrow,
    Optional<int>? score,
  }) {
    return TenthFrame(
      firstThrow: firstThrow == null ? this.firstThrow : firstThrow.orNull,
      secondThrow: secondThrow == null ? this.secondThrow : secondThrow.orNull,
      thirdThrow: thirdThrow == null ? this.thirdThrow : thirdThrow.orNull,
      score: score == null ? this.score : score.orNull,
    );
  }

  bool get hasThirdThrow => thirdThrow != null;
  bool get requiresThirdThrow => isSpare || secondThrow == 10;
  bool get hasSpare => isSpare || thirdThrow == 10;
  bool get hasStrike => isStrike || secondThrow == 10 || thirdThrow == 10;

  @override
  bool get isComplete => firstThrow != null && secondThrow != null && (!requiresThirdThrow || thirdThrow != null);

  int get strikeCount {
    return [
      isStrike,
      secondThrow == 10,
      thirdThrow == 10,
    ].count((value) => value);
  }

  @override
  int? get currentThrow {
    if (firstThrow == null) {
      return 1;
    }

    if (secondThrow == null) {
      return 2;
    }

    if (thirdThrow == null && (isSpare || secondThrow == 10)) {
      return 3;
    }

    return null;
  }
}