import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/roller.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/game_page_wrapper.dart';
import '../../../widgets/page_nav_button.dart';
import '../../corridor/services/game_service.dart';

class ForkPage extends ConsumerWidget {
  final AppRoute route;

  const ForkPage({super.key, this.route = AppRoute.treasureRoom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameServiceProvider);
    final styles = context.textStyles;

    return GamePageWrapper(
      bannerTitle: 'Choose',
      bgImagePath: 'assets/images/fork_bg.webp',
      children: [
        BgBubble(
          child: Text(
            "Around the next corner, you find yourself looking at multiple doors. You've got a decision to make! Are you feeling lucky?",
            style: styles.displaySmall,
          ),
        ),
        boxXXL,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final door in Door.values)
              PageNavButton(
                onPressed: () async {
                  final specialDoor = Door.random();

                  if (door == specialDoor) {
                    await showInfoDialog(
                      context: context,
                      title: "Treasure!",
                      message: "You've discovered a hidden treasure room.",
                    );

                    ref.read(goRouterProvider).goNamed(route.name);
                  } else if (gameState.canFindLair) {
                    await showInfoDialog(
                      context: context,
                      title: "Lair!",
                      message: "This isn't where you hoped to be! With trepidation, you explore the lair you've stumbled into.",
                    );

                    ref.read(goRouterProvider).goNamed(AppRoute.lair.name);
                  } else {
                    await showInfoDialog(
                      context: context,
                      title: "Room!",
                      message: "Nothing but another dungeon room with another challenge.",
                    );

                    ref.read(goRouterProvider).goNamed(AppRoute.room.name);
                  }
                },
                label: "$door Door",
              ),
          ].joinWidgetList(boxM).toList(),
        ),
      ],
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
