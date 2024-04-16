import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/game_bar.dart';
import '../../../widgets/gold_display.dart';
import '../../../widgets/image_option_button.dart';
import '../../../widgets/stats_page.dart';
import '../../app/services/app/app_service.dart';
import '../services/game_service.dart';

class CorridorPage extends ConsumerWidget {
  const CorridorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);
    final bowlingTip = ref.read(appServiceProvider.notifier).getBowlingTip();

    return BackdropScaffold(
      appBar: buildGameBar(state),
      maintainBackLayerState: false,
      backLayerBackgroundColor: Colors.black,
      backLayer: const StatsPage(),
      frontLayer: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/corridor_bg.webp'),
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
                    title: "The Corridor",
                  ),
                  boxXXL,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (state.frame != 10)
                            ImageOptionButton(
                              title: 'Next Room',
                              description: "A basic challenge.",
                              imagePath: 'assets/images/room_door.webp',
                              icon: const GoldDisplay(qty: 1, isCompact: true, isAdd: true),
                              onPressed: () {
                                final route = ref.read(gameServiceProvider.notifier).nextRoom();
                                context.goNamed(route.name);
                              },
                            )
                          else
                            ImageOptionButton(
                              title: 'Enter Lair',
                              description: "A greater challenge awaits.",
                              imagePath: 'assets/images/lair_door.webp',
                              icon: const GoldDisplay(qty: 3, isCompact: true, isAdd: true),
                              onPressed: () => context.goNamed(AppRoute.lair.name),
                            ),
                          if (state.canFindLair) ...[
                            boxL,
                            ImageOptionButton(
                              title: 'Find a Lair',
                              description: "More risk, more reward.",
                              imagePath: 'assets/images/lair_door.webp',
                              icon: const GoldDisplay(qty: 3, isCompact: true, isAdd: true),
                              onPressed: () => context.goNamed(AppRoute.foundLair.name),
                            ),
                          ],
                          boxL,
                          ImageOptionButton(
                            title: 'Quit',
                            description: "Admit defeat and flee.",
                            imagePath: 'assets/images/quit.webp',
                            onPressed: () {
                              showConfirmDialog(
                                context: context,
                                message: "Are you sure you want to end this game?",
                                onConfirm: () => context.goNamed(AppRoute.home.name),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 350.0),
                    child: Card.filled(
                      color: Colors.blue,
                      child: Padding(
                        padding: paddingAllM,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(FontAwesomeIcons.bowlingBall),
                            boxL,
                            Expanded(child: Text(bowlingTip)),
                          ],
                        ),
                      ),
                    ),
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
