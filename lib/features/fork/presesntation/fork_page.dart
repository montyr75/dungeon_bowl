import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

import '../../../routes.dart';
import '../../../utils/roller.dart';
import '../../../utils/screen_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/game_bar.dart';
import '../../../widgets/stats_page.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../corridor/services/game_service.dart';

class ForkPage extends ConsumerWidget {
  final AppRoute route;

  const ForkPage({super.key, this.route = AppRoute.treasureRoom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameServiceProvider);

    final styles = context.textStyles;

    return BackdropScaffold(
      appBar: buildGameBar(gameState),
      maintainBackLayerState: false,
      backLayerBackgroundColor: Colors.black,
      backLayer: const StatsPage(),frontLayer: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fork_bg.webp'),
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
                    title: "Choose",
                  ),
                  boxXXL,
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
                          onPressed: () => _checkDoor(context, door),
                          label: "$door Door",
                        ),
                    ].joinWidgetList(boxM).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkDoor(BuildContext context, Door door) {
    final specialDoor = Door.random();

    if (door == specialDoor) {
      context.goNamed(route.name);
    } else {
      context.goNamed(AppRoute.room.name);
    }
  }
}

enum Door {
  left,
  right;

  @override
  String toString() => ReCase(name).titleCase;

  static Door random() => Door.values[rand(Door.values.length)];
}
