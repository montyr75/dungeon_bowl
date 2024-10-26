import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/bowling_tip.dart';
import '../../../widgets/game_bar.dart';
import '../../../widgets/image_option_button.dart';
import '../../../widgets/stats_page.dart';
import '../../corridor/services/game_service.dart';

class TavernPage extends ConsumerWidget {
  const TavernPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);
    final report = ref.read(gameServiceProvider.notifier).generateReport();

    final styles = context.textStyles;

    return BackdropScaffold(
      appBar: buildGameBar(state),
      maintainBackLayerState: false,
      backLayerBackgroundColor: Colors.black,
      backLayer: const StatsPage(),
      frontLayer: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tavern_bg.webp'),
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
                    title: "The Tavern",
                  ),
                  boxXXL,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BgBubble(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Success Rate:",
                                  style: styles.displayMedium,
                                ),
                                boxM,
                                Text(
                                  "${report.percentSuccess}%",
                                  style: styles.displayMedium,
                                ),
                              ],
                            ),
                          ),
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
