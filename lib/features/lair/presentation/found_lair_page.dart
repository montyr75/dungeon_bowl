import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/encounter_image.dart';
import '../../../widgets/game_bar.dart';
import '../../../widgets/stats_page.dart';
import '../../bowling_challenge/presentation/challenge_display.dart';
import '../../corridor/services/game_service.dart';
import '../controllers/found_lair_ctrl.dart';

class FoundLairPage extends ConsumerWidget {
  const FoundLairPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(foundLairCtrlProvider);
    final gameState = ref.watch(gameServiceProvider);

    final styles = context.textStyles;

    return BackdropScaffold(
      appBar: buildGameBar(gameState),
      maintainBackLayerState: false,
      backLayerBackgroundColor: Colors.black,
      backLayer: const StatsPage(),
      frontLayer: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lair_bg.webp'),
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
                            showButtons: !state.isChallenge1Success,
                            onSuccess: () {
                              ref.read(foundLairCtrlProvider.notifier).challenge1Success();
                              ref.read(gameServiceProvider.notifier).foundLairSuccess(state);
                            },
                            onFailure: () {
                              ref.read(gameServiceProvider.notifier).foundLairFailure(state);
                              context.pop();
                            },
                          ),
                          if (state.isChallenge1Success)
                            ChallengeDisplay(
                              challenge: state.challenge2,
                              strength: state.strength,
                              onSuccess: () {
                                final treasure = ref.read(foundLairCtrlProvider.notifier).success();

                                TreasureDialog.show(
                                  treasure,
                                  onDismiss: () {
                                    ref.read(gameServiceProvider.notifier).foundLairSuccess(state, treasure);
                                    ref.read(goRouterProvider).pop();
                                  },
                                );
                              },
                              onFailure: () {
                                ref.read(gameServiceProvider.notifier).foundLairFailure(state);
                                context.pop();
                              },
                            ),
                        ],
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
