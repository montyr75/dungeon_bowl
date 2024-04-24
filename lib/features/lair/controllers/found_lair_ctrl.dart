import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app_config.dart';
import '../../../data/bowling_challenges.dart';
import '../../../data/lair_encounters.dart';
import '../../../data/treasure.dart';
import '../../../utils/roller.dart';
import '../../../utils/utils.dart';
import '../../app/services/app/app_service.dart';
import 'found_lair_state.dart';

part 'found_lair_ctrl.g.dart';

@riverpod
class FoundLairCtrl extends _$FoundLairCtrl {
  @override
  FoundLairState build() {
    final bowlerLevel = ref.read(appServiceProvider).bowlerLevel;

    final lvl = bowlerLevel.encounterLevelTable.lookup(roll(100))!.minOf(4);
    final str = (rollDice(1, lvl, 3) + bowlerLevel.challengeMod).maxOf(10);

    final challenge1 = BowlingChallenge.generateBowlingChallenge(
      level: lvl,
      mod: bowlerLevel.challengeMod,
      strength: str,
    );

    final challenge2 = BowlingChallenge.generateBowlingChallenge(
      level: lvl,
      mod: bowlerLevel.challengeMod + 1,
      strength: str,
    );

    final initialState = FoundLairState(
      enounterLevel: lvl,
      encounter: LairEncounter.randomEncounterByLevel(lvl),
      challenge1: challenge1,
      challenge2: challenge2,
      strength: str,
    );

    log.info(initialState);

    return initialState;
  }

  void challenge1Success() {
    state = state.copyWith(isChallenge1Success: true);
  }

  Treasure success() => Treasure.random(isLair: true);
}
