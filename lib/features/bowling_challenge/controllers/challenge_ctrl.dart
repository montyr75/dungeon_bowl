import 'package:quiver/core.dart' show Optional;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/bowling_challenges.dart';
import '../../../models/frame.dart';
import 'challenge_state.dart';

part 'challenge_ctrl.g.dart';

@riverpod
class ChallengeCtrl extends _$ChallengeCtrl {
  @override
  ChallengeState build({required BowlingChallenge challenge, int? strength}) {
    return ChallengeState(
      challenge: challenge,
      strength: strength,
      frame: challenge is TenthFrameBowlingChallenge ? const TenthFrame() : const Frame(),
    );
  }

  void updateThrow({required int ballThrow, required int value}) {
    ChallengeState newState = state;

    if (ballThrow == 1) {
      newState = newState.copyWith(
        frame: newState.frame.copyWith(
          firstThrow: Optional<int>.of(value),
          secondThrow: const Optional<int>.absent(),
        ),
      );

      if (newState.isTenthFrame) {
        newState = newState.copyWith(
          frame: (newState.frame as TenthFrame).copyWith(
            thirdThrow: const Optional<int>.absent(),
          ),
        );
      }
    }
    else if (ballThrow == 2) {
      newState = newState.copyWith(
        frame: newState.frame.copyWith(
          secondThrow: Optional<int>.of(value),
        ),
      );

      if (newState.isTenthFrame) {
        newState = newState.copyWith(
          frame: (newState.frame as TenthFrame).copyWith(
            thirdThrow: const Optional<int>.absent(),
          ),
        );
      }
    }
    else if (ballThrow == 3) {
      newState = newState.copyWith(
        frame: (newState.frame as TenthFrame).copyWith(
          thirdThrow: Optional<int>.of(value),
        ),
      );
    }

    state = newState.copyWith(
      isSuccess: (!newState.isTenthFrame && newState.frame.isStrike) ||
          newState.challenge.evaluate(
            frame: newState.frame,
            strength: newState.strength,
          ),
    );
  }
}
