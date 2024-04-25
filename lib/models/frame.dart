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
    int? firstThrow,
    int? secondThrow,
    int? score,
  }) {
    return Frame(
      firstThrow: firstThrow ?? this.firstThrow,
      secondThrow: secondThrow ?? this.secondThrow,
      score: score ?? this.score,
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