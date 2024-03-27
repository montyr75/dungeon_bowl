import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../features/characters/presentation/character_image.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';

class CharacterBar extends StatelessWidget {
  static const size = 50.0;

  final GameState state;
  final bool hideFrameDisplay;

  const CharacterBar({super.key, required this.state, this.hideFrameDisplay = false});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CharacterImage(
            character: state.character.character,
            size: size,
          ),
          if (hideFrameDisplay) const Spacer()
          else boxL,
          Text(
            state.character.gp.toString(),
            style: styles.displayLarge.copyWith(color: Colors.yellow),
          ),
          boxS,
          Image.asset(
            'assets/images/gold_coins.png',
            width: 32,
          ),
          if (!hideFrameDisplay) ...[
            const Spacer(),
            SizedBox(
              width: size * 1.2,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.flip(
                      flipX: true,
                      child: Image.asset(
                        'assets/images/left_rounded_border.png',
                        width: size,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "${state.game} : ${state.frame}",
                      style: styles.displayMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
