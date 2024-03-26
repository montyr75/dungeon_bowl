import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/character_bar.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../services/game_service.dart';

class CorridorPage extends ConsumerWidget {
  const CorridorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gameServiceProvider);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/corridor_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: paddingAllXXL,
                child: CharacterBar(
                  state: state,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (state.frame != 10) PageNavButton(
                    onPressed: () {
                      context.goNamed(AppRoute.room.name);
                    },
                    label: 'Next Room',
                  )
                  else PageNavButton(
                    onPressed: () => context.goNamed(AppRoute.lair.name),
                    label: 'Enter Lair',
                  ),
                  boxXXL,boxXXL,boxXXL,
                  PageNavButton(
                    onPressed: () {
                      showConfirmDialog(
                        context: context,
                        message: "Are you sure you want to quit the game?",
                        onConfirm: () => context.goNamed(AppRoute.home.name),
                      );
                    },
                    label: 'End Game',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
