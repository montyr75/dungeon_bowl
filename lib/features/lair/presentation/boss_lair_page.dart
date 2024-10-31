import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/encounter_image.dart';
import '../../../widgets/game_page_wrapper.dart';
import '../../bowling_challenge/presentation/challenge_display.dart';
import '../../corridor/services/game_service.dart';
import '../controllers/boss_lair_ctrl.dart';

class BossLairPage extends ConsumerWidget {
  const BossLairPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bossLairCtrlProvider);
    final styles = context.textStyles;

    return GamePageWrapper(
      bgImagePath: 'assets/images/lair_bg.webp',
      children: [
        BgBubble(
          type: BubbleType.lairEncounter,
          child: Text(
            state.encounter.toString(),
            style: styles.displayLarge,
          ),
        ),
        boxM,
        EncounterImage(imagePath: state.encounter.imagePath),
        boxM,
        BgBubble(
          child: Text(
            state.encounter.description,
            style: styles.displaySmall,
          ),
        ),
        boxM,
        ChallengeDisplay(
          challenge: state.challenge,
          strength: state.strength,
          onSuccess: (frame) {
            final treasure = ref.read(bossLairCtrlProvider.notifier).success();

            TreasureDialog.show(
              treasure,
              onDismiss: () {
                ref.read(gameServiceProvider.notifier).lairSuccess(
                  lairState: state,
                  frameData: frame,
                  treasure: treasure,
                );

                ref.read(goRouterProvider).goNamed(AppRoute.tavern.name);
              },
            );
          },
          onFailure: (frame) {
            ref.read(gameServiceProvider.notifier).lairFailure(
              lairState: state,
              frameData: frame,
            );

            context.goNamed(AppRoute.tavern.name);
          },
        ),
      ],
    );
  }
}