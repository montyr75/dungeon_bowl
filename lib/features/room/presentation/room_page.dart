import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/screen_utils.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../characters/presentation/character_details_page.dart';
import '../controllers/room_ctrl.dart';

class RoomPage extends ConsumerWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(roomCtrlProvider);
    final styles = context.textStyles;

    print(state);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/room_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BgBubble(
                child: Text(
                  "${state.encounter}\n${state.challenge.toDisplay(state.strength)}",
                  style: styles.displayMedium,
                ),
              ),
              boxXXL,
              PageNavButton(
                onPressed: () => context.pop(),
                label: 'Success',
              ),
              boxL,
              PageNavButton(
                onPressed: () => context.pop(),
                label: 'Fail',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
