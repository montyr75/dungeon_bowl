import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../features/characters/presentation/character_image.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';

class CharacterBar extends StatelessWidget {
  static const maxWidth = 175.0;
  static const size = 75.0;

  final GameState state;

  const CharacterBar({super.key, required this.state});

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
          boxM,
          SizedBox(
            width: size * 1.2,
            height: size,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/gold_coin.png',
                    width: 15,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/left_ornate_border.png'),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.character.gp.toString(),
                    style: styles.displayMedium.copyWith(color: Colors.yellow),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      'assets/images/left_ornate_border.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Frame ${state.frame.toString()}",
                    style: styles.displayMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
