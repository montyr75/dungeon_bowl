import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/character_bar.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../app/services/app/app_service.dart';
import '../../corridor/services/game_service.dart';

class TavernPage extends ConsumerWidget {
  const TavernPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);
    final bowlingTip = ref.read(appServiceProvider.notifier).getBowlingTip();

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
              boxXXL,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 200,
                    child: Placeholder(),
                  ),
                  boxXXL,
                  PageNavButton(
                    onPressed: () {
                      context.pop();
                    },
                    label: 'Next Dungeon',
                  ),
                  boxXXL,
                  PageNavButton(
                    onPressed: () {
                      showConfirmDialog(
                        context: context,
                        message: "Are you sure you want to end this game?",
                        onConfirm: () => context.goNamed(AppRoute.home.name),
                      );
                    },
                    label: 'End Game',
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
