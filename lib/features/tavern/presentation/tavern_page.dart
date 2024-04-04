import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/character_bar.dart';
import '../../../widgets/image_option_button.dart';
import '../../app/services/app/app_service.dart';
import '../../corridor/services/game_service.dart';

class TavernPage extends ConsumerWidget {
  const TavernPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);
    final report = ref.read(gameServiceProvider.notifier).generateReport();
    final bowlingTip = ref.read(appServiceProvider.notifier).getBowlingTip();

    final styles = context.textStyles;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tavern_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: Column(
            children: [
              CharacterBar(
                state: state,
                hideFrameDisplay: true,
              ),
              const BannerTitle(
                title: "The Tavern",
              ),
              boxXXL,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BgBubble(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Rooms Defeated: ${report.encountersWon} / ${report.totalEncounters}",
                          style: styles.displayMedium,
                        ),
                        boxM,
                        Text(
                          "Lairs Defeated: ${report.lairsWon} / ${report.totalLairs}",
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
              const Spacer(),
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
              boxXXL,
            ],
          ),
        ),
      ),
    );
  }
}
