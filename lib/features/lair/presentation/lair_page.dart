import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/challenge_display.dart';
import '../../../widgets/character_bar.dart';
import '../../../widgets/encounter_image.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../corridor/services/game_service.dart';
import '../controllers/lair_ctrl.dart';

class LairPage extends ConsumerWidget {
  const LairPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lairCtrlProvider);
    final styles = context.textStyles;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lair_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: Column(
            children: [
              CharacterBar(
                state: ref.watch(gameServiceProvider),
              ),
              boxXXL,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BgBubble(
                    child: Text(
                      state.encounter.toString(),
                      style: styles.displayLarge,
                    ),
                  ),
                ],
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
              ),
              boxM,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageNavButton(
                    onPressed: () {
                      showConfirmDialog(
                        context: context,
                        title: "Failure!",
                        message:
                            "You have failed! Quickly, you turn and run, determined to live to fight another day.",
                        yesMsg: "Confirm Failure",
                        noMsg: "Cancel",
                        onConfirm: () {
                          ref.read(gameServiceProvider.notifier).lairFailure();
                          context.pop();
                        },
                      );
                    },
                    label: 'Failure',
                  ),
                  boxXXL,
                  PageNavButton(
                    onPressed: () {
                      showConfirmDialog(
                        context: context,
                        title: "Success!",
                        message: "You've bested the challenge!\n\nRewards:\n3 Gold Coins",
                        yesMsg: "Confirm Success",
                        noMsg: "Cancel",
                        onConfirm: () {
                          ref.read(gameServiceProvider.notifier).lairSuccess();
                          context.pop();
                        },
                      );
                    },
                    label: 'Success',
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
