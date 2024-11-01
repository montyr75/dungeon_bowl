import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_config.dart';
import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../data/treasure.dart';
import '../../../utils/roller.dart';
import '../../../utils/utils.dart';
import '../../app/services/app/app_service.dart';
import 'boss_lair_state.dart';

part 'boss_lair_ctrl.g.dart';

@riverpod
class BossLairCtrl extends _$BossLairCtrl {
  @override
  BossLairState build() {
    final bowlerLevel = ref.read(appServiceProvider).bowlerLevel;

    final lvl = bowlerLevel.encounterLevelTable.lookup(roll(100))!.minOf(4);
    final str = (rollDice(1, lvl, 3) + bowlerLevel.challengeMod).maxOf(10);

    final challenge = TenthFrameBowlingChallenge.generateBowlingChallenge(
      level: lvl,
      mod: bowlerLevel.challengeMod,
      strength: str,
    );

    final initialState = BossLairState(
      encounterLevel: lvl,
      encounter: LairEncounter.randomEncounterByLevel(lvl),
      challenge: challenge,
      strength: challenge.isVariable ? str : null,
    );

    log.info(initialState);

    return initialState;
  }

  Treasure success() => Treasure.random(mod: 20, isLair: true);
}
