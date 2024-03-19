import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../characters/presentation/character_details_page.dart';
import '../services/game_service.dart';

class CorridorPage extends ConsumerWidget {
  const CorridorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);
    final styles = context.textStyles;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/corridor_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.frame > 0) BgBubble(
                  child: Text(
                "Frame: ${state.frame}",
                    style: styles.displayMedium,
              )),
              boxXXL,
              PageNavButton(
                onPressed: () {
                  ref.read(gameServiceProvider.notifier).nextRoom();
                  context.goNamed(AppRoute.room.name);
                },
                label: 'Next Room',
              ),
              boxL,
              PageNavButton(
                onPressed: () => null,
                label: 'Find a Lair',
              ),
              boxXXL,
              PageNavButton(
                onPressed: () {
                  showConfirmDialog(
                    message: "Are you sure you want to quit the game?",
                    onConfirm: () => context.goNamed(AppRoute.home.name),
                  );
                },
                label: 'Exit Game',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
