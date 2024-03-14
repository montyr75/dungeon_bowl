import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../../data/characters.dart';
import '../../../utils/screen_utils.dart';

class CharacterSelectionPage extends StatelessWidget {
  const CharacterSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tavern.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: LayoutGrid(
            // set some flexible track sizes based on the crossAxisCount
            columnSizes: [1.fr, 1.fr],
            // set all the row sizes to auto (self-sizing height)
            rowSizes: [1.fr, 1.fr],
            rowGap: med,
            // equivalent to mainAxisSpacing
            columnGap: 40,
            // equivalent to crossAxisSpacing
            // note: there's no childAspectRatio
            children: Character.values.map((value) => CharacterOption(character: value)).toList(),
          ),
          // child: GridView.count(
          //   crossAxisCount: 2,
          //   children: Character.values.map((value) => CharacterOption(character: value)).toList(),
          // ),
        ),
      ),
    );
  }
}

class CharacterOption extends StatelessWidget {
  static const imageSize = 200.0;
  static const cornerHeight = 50.0;

  final Character character;

  const CharacterOption({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black45,
            Colors.black38,
            Colors.black45,
          ],
        ),
      ),
      padding: paddingAllM,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: imageSize,
            height: imageSize,
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    character.imagePath,
                    width: imageSize * .95,
                    height: imageSize * .95,
                  ),
                ),
                TopLeft(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Image.asset(
                      'assets/images/image_corner.png',
                      height: cornerHeight,
                    ),
                  ),
                ),
                TopRight(
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Image.asset(
                      'assets/images/image_corner.png',
                      height: cornerHeight,
                    ),
                  ),
                ),
                BottomLeft(
                  child: Image.asset(
                    'assets/images/image_corner.png',
                    height: cornerHeight,
                  ),
                ),
                BottomRight(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Image.asset(
                      'assets/images/image_corner.png',
                      height: cornerHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          boxM,
          Text(
            character.toString(),
            style: styles.displayMedium,
          ),
          boxS,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${character.race} ",
                style: styles.displaySmall,
              ),
              Text(
                character.profession,
                style: styles.displaySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
