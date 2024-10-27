import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/game_page_wrapper.dart';
import '../../../widgets/image_option_button.dart';
import '../../../widgets/page_nav_button.dart';
import '../../../widgets/treasure_display.dart';
import '../controllers/treasure_room_ctrl.dart';

class TreasureRoomPage extends ConsumerWidget {
  const TreasureRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(treasureRoomCtrlProvider);
    final styles = context.textStyles;

    return GamePageWrapper(
      bannerTitle: "Treasure Room",
      bgImagePath: 'assets/images/treasure_room_bg.webp',
      children: [
        BgBubble(
          child: Text(
            "You've stumbled upon a treasure room! You cast your eyes about nervously and reach forward. You don't think anyone will mind if you take just a little...",
            style: styles.displaySmall,
          ),
        ),
        boxL,
        BgBubble(
          child: TreasureDisplay(treasure: state.treasure),
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
            onPressed: () => context.goNamed(AppRoute.room.name),
          ).animate().fade(),
      ],
    );
  }
}
