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
import '../controllers/lair_ctrl.dart';

class LairPage extends ConsumerWidget {
  const LairPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(lairCtrlProvider);
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
                            challenge: state.challenge,
                            strength: state.strength,
                            onSuccess: (frame) {
                              final treasure = ref.read(lairCtrlProvider.notifier).success();

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
