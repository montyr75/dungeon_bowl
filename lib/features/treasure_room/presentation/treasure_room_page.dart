import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

import '../../../routes.dart';
import '../../../utils/roller.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/game_bar.dart';
import '../../../widgets/gold_display.dart';
import '../../../widgets/image_option_button.dart';
import '../../../widgets/stats_page.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../corridor/services/game_service.dart';
import '../controllers/treasure_room_ctrl.dart';

class TreasureRoomPage extends ConsumerWidget {
  const TreasureRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(treasureRoomCtrlProvider);
    final gameState = ref.watch(gameServiceProvider);

    final styles = context.textStyles;

    return BackdropScaffold(
      appBar: buildGameBar(gameState),
      maintainBackLayerState: false,
      backLayerBackgroundColor: Colors.black,
      backLayer: const StatsPage(),
      frontLayer: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/treasure_room_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const PageBannerTitle(
                    title: "Treasure Room",
                  ),
                  boxXXL,
                  BgBubble(
                    child: Text(
                      "You've stumbled upon a treasure room!\n\nRewards:\n1 Gold Coin",
                      style: styles.displaySmall,
                    ),
                  ),
                  boxXXL,
                  if (!state.isClaimed)
                    PageNavButton(
                      label: "Claim Reward",
                      onPressed: () => ref.read(treasureRoomCtrlProvider.notifier).claimTreasure(),
                    )
                  else
                    ImageOptionButton(
                      title: 'Next Room',
                      description: "Continue to the next room.",
                      imagePath: 'assets/images/room_door.webp',
                      icon: const GoldDisplay(qty: 1, isCompact: true, isAdd: true),
                      onPressed: () => context.goNamed(AppRoute.room.name),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Door {
  left,
  right;

  @override
  String toString() => ReCase(name).titleCase;

  static Door random() => Door.values[rand(Door.values.length)];
}
