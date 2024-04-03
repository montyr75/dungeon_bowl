import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';

import '../features/characters/presentation/character_image.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';
import 'gold_display.dart';

class CharacterBar extends StatelessWidget {
  static const size = 50.0;

  final GameState state;
  final bool showNext;
  final bool hideFrameDisplay;

  const CharacterBar({
    super.key,
    required this.state,
    this.showNext = false,
    this.hideFrameDisplay = false,
  });

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Card(
      color: Colors.black54,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            CenterLeft(
              child: CharacterImage(
                character: state.character.character,
                size: size,
              ),
            ),
            CenterRight(
              child: GoldDisplay(
                qty: state.character.gp,
              ),
            ),
            if (!hideFrameDisplay) ...[
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Game", style: styles.bodySmall),
                        boxS,
                        Text(state.game.toString(), style: styles.displayMedium),
                      ],
                    ),
                    boxM,
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("${showNext ? 'Next ' : ''}Frame", style: styles.bodySmall),
                        boxS,
                        Text(state.frame.toString(), style: styles.displayMedium),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
