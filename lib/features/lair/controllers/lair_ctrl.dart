import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../utils/roller.dart';
import '../../../utils/utils.dart';
import '../../app/services/app/app_service.dart';
import 'lair_state.dart';

part 'lair_ctrl.g.dart';

@riverpod
class LairCtrl extends _$LairCtrl {
  @override
  LairState build() {
    final appState = ref.read(appServiceProvider);

    final lvl = appState.bowlerLevel.encounterLevelTable.lookup(roll(100))!.minOf(4);
    TenthFrameBowlingChallenge challenge = _generateBowlingChallenge(lvl, appState.bowlerLevel.challengeMod);

    int? strength;
    if (challenge.isVariable) {
      strength = (rollDice(1, lvl, 3) + appState.bowlerLevel.challengeMod).maxOf(10);

      // a strength of 10 (or 9 and 1) requires the player to strike or spare
      if (strength == 10) {
        if (challenge.firstThrow == BowlingHit.min) {
          challenge = tenthFrameBowlingChallenges.getByLevel(6)!;
        }
      }
      else if (strength == 9 && challenge.secondThrow == BowlingHit.min1) {
        challenge = tenthFrameBowlingChallenges.getByLevel(4)!;
      }
    }

    final initialState = LairState(
      enounterLevel: lvl,
      encounter: LairEncounter.randomEncounterByLevel(lvl),
      challenge: challenge,
      strength: strength,
    );

    print(initialState);

    return initialState;
  }

  TenthFrameBowlingChallenge _generateBowlingChallenge(int level, int mod) {
    final challenges = tenthFrameBowlingChallenges.take(level).toList();
    final roll = rand(challenges.length) + mod;

    return challenges[roll.maxOf(challenges.length - 1)];
  }
}
