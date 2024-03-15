import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';

import '../../../data/characters.dart';

class CharacterImage extends StatelessWidget {
  static const cornerImage = 'assets/images/image_corner.png';

  final Character character;
  final double size;

  const CharacterImage({
    super.key,
    required this.character,
    this.size = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    final cornerHeight = size * 0.25;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              character.imagePath,
              width: size * .95,
              height: size * .95,
            ),
          ),
          TopLeft(
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                cornerImage,
                height: cornerHeight,
              ),
            ),
          ),
          TopRight(
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                cornerImage,
                height: cornerHeight,
              ),
            ),
          ),
          BottomLeft(
            child: Image.asset(
              cornerImage,
              height: cornerHeight,
            ),
          ),
          BottomRight(
            child: RotatedBox(
              quarterTurns: 3,
              child: Image.asset(
                cornerImage,
                height: cornerHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
