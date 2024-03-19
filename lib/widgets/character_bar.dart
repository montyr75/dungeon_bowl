import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../features/characters/presentation/character_image.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';

class CharacterBar extends StatelessWidget {
  static const maxWidth = 200.0;
  static const size = 75.0;

  final GameState state;

  const CharacterBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CharacterImage(
            character: state.character.character,
            size: size,
          ),
          boxM,
          Expanded(
            child: Container(
              height: size,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text("Frame", style: styles.displaySmall),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(state.frame.toString(), style: styles.displayMedium),
                  ),
                ],
              ),
            ),
          ),
          boxM,
          Expanded(
            child: Container(
              height: size,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text("GP", style: styles.displaySmall),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(state.character.gp.toString(), style: styles.displayMedium),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
