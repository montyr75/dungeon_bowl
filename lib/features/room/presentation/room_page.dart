import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_config.dart';
import '../../../data/treasure.dart';
import '../../../models/frame.dart';
import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/encounter_image.dart';
import '../../../widgets/game_page_wrapper.dart';
import '../../bowling_challenge/presentation/challenge_display.dart';
import '../../corridor/services/game_service.dart';
import '../controllers/room_ctrl.dart';
import '../controllers/room_state.dart';

class RoomPage extends ConsumerWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roomCtrlProvider);
    final styles = context.textStyles;

    return GamePageWrapper(
      bgImagePath: 'assets/images/room_bg.webp',
      children: [
        BgBubble(
          type: BubbleType.encounter,
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
          onSuccess: (frame) async {
            final gameService = ref.read(gameServiceProvider.notifier);

            final items = gameService.checkInventory(
              encounter: state.encounter,
              timing: TreasureEffectTiming.encounterEnd,
            );

            log.info("RoomPage::_onSuccess() -- ITEMS: $items");

            if (items.isNotEmpty) {
              final autoFailItem = await items.applyTreasureEffects(
                context: context,
                gameService: gameService,
                effects: const [TreasureEffect.autoFail],
              );

              if (autoFailItem != null) {
                _fail(ref: ref, state: state, frame: frame);
                return;
              }
            }

            _succeed(ref: ref, state: state, frame: frame);
          },
          onFailure: (frame) async {
            final gameService = ref.read(gameServiceProvider.notifier);

            final items = gameService.checkInventory(
              encounter: state.encounter,
              timing: TreasureEffectTiming.encounterEnd,
            );

            log.info("RoomPage::_onFailure() -- ITEMS: $items");

            if (items.isNotEmpty) {
              final usedItem = await items.applyTreasureEffects(
                context: context,
                gameService: gameService,
                effects: const [
                  TreasureEffect.autoSuccess,
                  TreasureEffect.autoSuccessAll,
                ],
              );

              if (usedItem != null) {
                _succeed(ref: ref, state: state, frame: frame);
                return;
              }
            }

            _fail(ref: ref, state: state, frame: frame);
          },
        ),
      ],
    );
  }

  void _succeed({
    required WidgetRef ref,
    required RoomState state,
    required Frame frame,
    TreasureEffect? effect,
  }) {
    final gameService = ref.read(gameServiceProvider.notifier);
    final treasure = ref.read(roomCtrlProvider.notifier).success(effect);

    TreasureDialog.show(
      treasure,
      onDismiss: () {
        gameService.roomSuccess(
          roomState: state,
          frameData: frame,
          treasure: treasure,
        );

        ref.read(goRouterProvider).pop();
      },
    );
  }

  void _fail({
    required WidgetRef ref,
    required RoomState state,
    required Frame frame,
  }) {
    ref.read(gameServiceProvider.notifier).roomFailure(
          roomState: state,
          frameData: frame,
        );

    ref.read(goRouterProvider).pop();
  }
}

extension ItemListX on List<Treasure> {
  Future<Treasure?> applyTreasureEffects({
    required BuildContext context,
    required GameService gameService,
    required List<TreasureEffect> effects,
  }) async {
    for (final effect in effects) {
      final item = getByEffect(effect);

      if (item != null) {
        await showUseItemDialog(
          context: context,
          item: item,
        );

        gameService.removeTreasure(item);

        return item;
      }
    }

    return null;
  }
}
