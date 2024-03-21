import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/screen_utils.dart';
import '../../../widgets/challenge_display.dart';
import '../../../widgets/character_bar.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../characters/presentation/character_details_page.dart';
import '../../corridor/services/game_service.dart';
import '../controllers/room_ctrl.dart';

class RoomPage extends ConsumerWidget {
  static const imageSize = 250.0;

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
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: paddingAllXXL,
                child: CharacterBar(
                  state: ref.watch(gameServiceProvider),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BgBubble(
                    child: Text(
                      state.encounter.toString(),
                      style: styles.displayLarge,
                    ),
                  ),
                  boxM,
                  SizedBox(
                    width: imageSize * 1.1,
                    height: imageSize * 1.1,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            state.encounter.imagePath,
                            width: imageSize,
                          ),
                        ),
                        Image.asset(
                          'assets/images/square_frame.png',
                          width: imageSize * 1.1,
                        ),
                      ],
                    ),
                  ),
                  boxXXL,
                  ChallengeDisplay(
                    challenge: state.challenge,
                    strength: state.strength,
                  ),
                  boxXXL,
                  PageNavButton(
                    onPressed: () {
                      ref.read(gameServiceProvider.notifier).success(state.encounter);
                      context.pop();
                    },
                    label: 'Success',
                  ),
                  boxL,
                  PageNavButton(
                    onPressed: () => context.pop(),
                    label: 'Failure',
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
