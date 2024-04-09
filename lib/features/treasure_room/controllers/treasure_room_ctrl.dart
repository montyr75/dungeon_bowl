import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/treasure.dart';
import '../../corridor/services/game_service.dart';
import 'treasure_room_state.dart';

part 'treasure_room_ctrl.g.dart';

@riverpod
class TreasureRoomCtrl extends _$TreasureRoomCtrl {
  @override
  TreasureRoomState build() => const TreasureRoomState(treasure: Treasure.goldCoin);

  void claimTreasure() {
    state = state.copyWith(isClaimed: true);
    ref.read(gameServiceProvider.notifier).awardGP(1);
  }
}
