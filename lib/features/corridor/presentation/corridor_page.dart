import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app_config.dart';
import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/game_page_wrapper.dart';
import '../../../widgets/image_option_button.dart';
import '../../app/services/app/app_service.dart';
import '../services/game_service.dart';

class CorridorPage extends ConsumerWidget {
  const CorridorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appServiceProvider);
    final state = ref.watch(gameServiceProvider);

    return GamePageWrapper(
      bannerTitle: 'The Corridor',
      bgImagePath: 'assets/images/corridor_bg.webp',
      showBowlingTip: true,
      children: [
        if (state.frame != 10)
          ImageOptionButton(
            title: 'Next Room',
            description: "A basic challenge.",
            imagePath: 'assets/images/room_door.webp',
            onPressed: () {
              final route = ref.read(gameServiceProvider.notifier).nextRoom();
              context.goNamed(route.name);
            },
          )
        else
          ImageOptionButton(
            title: 'Enter Lair',
            description: "A greater challenge awaits, and possibly more riches.",
            imagePath: 'assets/images/lair_door.webp',
            onPressed: () => context.goNamed(AppRoute.bossLair.name),
          ),
        if (appState.hasValidSave) ...[
          boxL,
          ImageOptionButton(
            title: 'Load Autosave',
            description: 'Restore previous progress.',
            imagePath: 'assets/images/load_book.webp',
            onPressed: () {
              showConfirmDialog(
                context: context,
                message: "Are you sure you want to load the last autosave?",
                onConfirm: () => ref.read(appServiceProvider.notifier).restoreState(),
              );
            },
          ),
        ],
        boxL,
        ImageOptionButton(
          title: 'Quit',
          description: "Admit defeat and flee.",
          imagePath: 'assets/images/quit.webp',
          onPressed: () {
            showConfirmDialog(
              context: context,
              message: "Are you sure you want to end this game?",
              onConfirm: () {
                ref.read(appServiceProvider.notifier).clearSaves();
                context.goNamed(AppRoute.home.name);
              },
            );
          },
        ),
        if (debugMode) ...[
          boxXXL,
          TextButton(
            onPressed: () {
              log.info(ref.read(appServiceProvider.notifier).serializeGameData());
            },
            child: Text("Show State"),
          ),
          boxM,
          TextButton(
            onPressed: () {
              ref.read(appServiceProvider.notifier).clearSaves();
            },
            child: Text("Clear Saves"),
          ),
        ],
      ],
    );
  }
}
