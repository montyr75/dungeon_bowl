import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/game_page_wrapper.dart';
import '../../../widgets/image_option_button.dart';
import '../../../widgets/success_rate_bubble.dart';

class TavernPage extends ConsumerWidget {
  const TavernPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GamePageWrapper(
      bannerTitle: "The Tavern",
      bgImagePath: 'assets/images/tavern_bg.webp',
      showBowlingTip: true,
      children: [
        SuccessRateBubble(),
        boxXXL,
        ImageOptionButton(
          title: 'Next Dungeon',
          description: "Brave another dungeon for your next bowling game.",
          imagePath: 'assets/images/dungeon_door.webp',
          onPressed: () => context.pop(),
        ),
        boxL,
        ImageOptionButton(
          title: 'Quit',
          description: "Return home alive.",
          imagePath: 'assets/images/quit2.webp',
          onPressed: () {
            showConfirmDialog(
              context: context,
              message: "Are you sure you want to end this game?",
              onConfirm: () => context.goNamed(AppRoute.home.name),
            );
          },
        ),
      ],
    );
  }
}
