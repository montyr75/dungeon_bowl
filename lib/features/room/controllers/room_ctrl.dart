import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_config.dart';
import '../../../data/bowling_challenges.dart';
import '../../../data/encounters.dart';
import '../../../data/treasure.dart';
import '../../../utils/roller.dart';
import '../../../utils/utils.dart';
import '../../app/services/app/app_service.dart';
import 'room_state.dart';

part 'room_ctrl.g.dart';

@riverpod
class RoomCtrl extends _$RoomCtrl {
  @override
  RoomState build() {
    final bowlerLevel = ref.read(appServiceProvider).bowlerLevel;

    final lvl = bowlerLevel.encounterLevelTable.lookup(roll(100))!;
    final str = (rollDice(1, lvl, 2) + bowlerLevel.challengeMod).maxOf(10);

    final challenge = BowlingChallenge.generateBowlingChallenge(
      level: lvl,
      mod: bowlerLevel.challengeMod,
      strength: str,
    );

    final initialState = RoomState(
      enounterLevel: lvl,
      encounter: Encounter.randomEncounterByLevel(lvl),
      challenge: challenge,
      strength: challenge.isVariable ? str : null,
    );

    log.info(initialState);

    return initialState;
  }

  Treasure success([TreasureEffect? effect]) {
    final mod = switch (effect) {
      TreasureEffect.rewardMod || TreasureEffect.maxReward => effect!.value!,
      _ => 0,
    };

    return Treasure.random(mod: mod);
  }
}
