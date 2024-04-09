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
import '../controllers/found_lair_ctrl.dart';

class FoundLairPage extends ConsumerWidget {
  const FoundLairPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(foundLairCtrlProvider);
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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
                        challenge: state.challenge1,
                        strength: state.strength,
                      ),
                      if (state.isChallenge1Success)
                        ChallengeDisplay(
                          challenge: state.challenge2,
                          strength: state.strength,
                        ),
                      boxM,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PageNavButton(
                            label: 'Failure',
                            color: ButtonColor.red,
                            onPressed: () {
                              showConfirmDialog(
                                context: context,
                                title: "Failure!",
                                message:
                                    "You have failed! Quickly, you turn and run, determined to live to fight another day.",
                                yesMsg: "Confirm Failure",
                                noMsg: "Cancel",
                                onConfirm: () {
                                  ref.read(gameServiceProvider.notifier).foundLairFailure(state);
                                  context.pop();
                                },
                              );
                            },
                          ),
                          boxXXL,
                          if (!state.isChallenge1Success)
                            PageNavButton(
                              label: 'Success',
                              color: ButtonColor.green,
                              onPressed: () {
                                showConfirmDialog(
                                  context: context,
                                  title: "First Success!",
                                  message: "You've bested the first challenge, but there's one more to go!",
                                  yesMsg: "Confirm Success",
                                  noMsg: "Cancel",
                                  onConfirm: () {
                                    ref.read(foundLairCtrlProvider.notifier).challenge1Success();
                                    ref.read(gameServiceProvider.notifier).foundLairSuccess(state, isChallenge1: true);
                                  },
                                );
                              },
                            )
                          else
                            PageNavButton(
                              label: 'Success',
                              color: ButtonColor.green,
                              onPressed: () {
                                showConfirmDialog(
                                  context: context,
                                  title: "Success!",
                                  message: "You've bested both challenges!\n\nRewards:\n3 Gold Coins",
                                  yesMsg: "Confirm Success",
                                  noMsg: "Cancel",
                                  onConfirm: () {
                                    ref.read(gameServiceProvider.notifier).foundLairSuccess(state, isChallenge1: false);
                                    context.pop();
                                  },
                                );
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
