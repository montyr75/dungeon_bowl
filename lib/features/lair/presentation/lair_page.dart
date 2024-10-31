import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
import '../controllers/lair_ctrl.dart';

class LairPage extends ConsumerWidget {
  const LairPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lairCtrlProvider);
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
          challengeID: 1,
          challenge: state.challenge1,
          strength: state.strength,
          showButtons: !state.isChallenge1Success,
          onSuccess: (frame) {
            ref.read(lairCtrlProvider.notifier).challenge1Success();
            ref.read(gameServiceProvider.notifier).foundLairSuccess(
              foundLairState: state,
              frameData: frame,
            );
          },
          onFailure: (frame) {
            ref.read(gameServiceProvider.notifier)
                .foundLairFailure(foundLairState: state, frameData: frame);

            context.pop();
          },
        ),
        if (state.isChallenge1Success)
          ChallengeDisplay(
            challengeID: 2,
            challenge: state.challenge2,
            strength: state.strength,
            onSuccess: (frame) {
              final treasure = ref.read(lairCtrlProvider.notifier).success();

              TreasureDialog.show(
                treasure,
                onDismiss: () {
                  ref.read(gameServiceProvider.notifier).foundLairSuccess(
                    foundLairState: state,
                    frameData: frame,
                    treasure: treasure,
                  );

                  ref.read(goRouterProvider).pop();
                },
              );
            },
            onFailure: (frame) {
              ref.read(gameServiceProvider.notifier).foundLairFailure(
                foundLairState: state,
                frameData: frame,
              );

              context.pop();
            },
          ).animate().slideY(),
      ],
    );
  }
}
