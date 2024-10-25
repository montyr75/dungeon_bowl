import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app_config.dart';
import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/bowling_tip.dart';
import '../../../widgets/game_bar.dart';
import '../../../widgets/image_option_button.dart';
import '../../../widgets/stats_page.dart';
import '../../app/services/app/app_service.dart';
import '../services/game_service.dart';

class CorridorPage extends ConsumerWidget {
  const CorridorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);

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
                              onPressed: () {
                                final route = ref.read(gameServiceProvider.notifier).nextRoom();
                                context.goNamed(route.name);
                              },
                            )
                          else
                            ImageOptionButton(
                              title: 'Enter Lair',
                              description: "A greater challenge awaits, and possibly more riches.",
                              imagePath: 'assets/images/lair_door.webp',
                              onPressed: () => context.goNamed(AppRoute.lair.name),
                            ),
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
                          if (debugMode) ...[
                            boxXXL,
                            TextButton(
                              onPressed: () {
                                log.info(ref.read(appServiceProvider.notifier).serializeGameData());
                              },
                              child: Text("Show State"),
                            ),
                            boxM,
                            TextButton(
                              onPressed: () {
                                // ref.read(gameServiceProvider.notifier).showSerialization()
                              },
                              child: Text("Save State"),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 350.0),
                    child: BowlingTip(),
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
