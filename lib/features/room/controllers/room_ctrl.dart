import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/bowling_challenges.dart';
import '../../../data/encounters.dart';
import '../../../utils/roller.dart';
import '../../../utils/utils.dart';
import '../../app/services/app/app_service.dart';
import 'room_state.dart';

part 'room_ctrl.g.dart';

@riverpod
class RoomCtrl extends _$RoomCtrl {
  @override
  RoomState build() {
    final appState = ref.read(appServiceProvider);

    final lvl = appState.bowlerLevel.encounterLevelTable.lookup(roll(100))!;
    BowlingChallenge challenge = _generateBowlingChallenge(lvl, appState.bowlerLevel.challengeMod);

    int? strength;
    if (challenge.isVariable) {
      strength = (rollDice(1, lvl, 2) + appState.bowlerLevel.challengeMod).maxOf(10);

      // a strength of 10 (or 9 and 1) requires the player to strike or spare
      if (strength == 10) {
        if (challenge.firstThrow == BowlingHit.min) {
          challenge = bowlingChallenges.last;
        }
        else if (challenge.frameTotal == BowlingHit.min) {
          challenge = bowlingChallenges.getByLevel(6)!;
        }
      }
      else if (strength == 9 && challenge.secondThrow == BowlingHit.min1) {
        challenge = bowlingChallenges.getByLevel(6)!;
      }
    }

    final initialState = RoomState(
      enounterLevel: lvl,
      encounter: Encounter.randomEncounterByLevel(lvl),
      challenge: challenge,
      strength: strength,
    );

    print(initialState);

    return initialState;
  }

  BowlingChallenge _generateBowlingChallenge(int level, int mod) {
    final challenges = bowlingChallenges.take(level).toList();
    final roll = rand(challenges.length) + mod;

    return challenges[roll.maxOf(challenges.length - 1)];
  }
}
