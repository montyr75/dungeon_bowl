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
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              character.imagePath,
              width: size * .89,
              height: size * .89,
            ),
          ),
          Image.asset(
            'assets/images/character_frame.png',
            width: size,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
