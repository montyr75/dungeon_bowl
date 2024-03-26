import 'package:flutter/material.dart';

class EncounterImage extends StatelessWidget {
  static const imageSize = 200.0;

  final String imagePath;

  const EncounterImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageSize * 1.1,
      height: imageSize * 1.1,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              imagePath,
              width: imageSize,
            ),
          ),
          Image.asset(
            'assets/images/square_frame.png',
            width: imageSize * 1.1,
          ),
        ],
      ),
    );
  }
}
