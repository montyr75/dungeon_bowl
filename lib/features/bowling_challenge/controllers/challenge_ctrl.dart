import 'package:quiver/core.dart' show Optional;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'challenge_state.dart';

part 'challenge_ctrl.g.dart';

@riverpod
class ChallengeCtrl extends _$ChallengeCtrl {
  @override
  ChallengeState build() => const ChallengeState();

  void updateThrow({required int ballThrow, required int value}) {
    if (ballThrow == 1) {
      state = state.copyWith(
        frame: state.frame.copyWith(
          firstThrow: Optional<int>.of(value),
          secondThrow: const Optional<int>.absent(),
          score: const Optional<int>.absent(),
        ),
      );
    }
    else if (ballThrow == 2) {
      state = state.copyWith(
        frame: state.frame.copyWith(
          secondThrow: Optional<int>.of(value),
          score: const Optional<int>.absent(),
        ),
      );
    }
  }
}
