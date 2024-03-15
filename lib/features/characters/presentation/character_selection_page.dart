import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import '../../../data/characters.dart';
import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import 'character_image.dart';

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
          // child: LayoutGrid(
          //   // set some flexible track sizes based on the crossAxisCount
          //   columnSizes: [1.fr, 1.fr],
          //   // set all the row sizes to auto (self-sizing height)
          //   rowSizes: [1.fr, 1.fr],
          //   rowGap: med,
          //   // equivalent to mainAxisSpacing
          //   columnGap: 40,
          //   // equivalent to crossAxisSpacing
          //   // note: there's no childAspectRatio
          //   children: Character.values.map((value) => CharacterOption(character: value)).toList(),
          // ),
          child: GridView.count(
            crossAxisCount: 2,
            children: Character.values
                .map(
                  (character) => CharacterOption(
                    character: character,
                    onPressed: () => context.goNamed(AppRoute.characterDetails.name, extra: character),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CharacterOption extends StatelessWidget {
  static const imageSize = 200.0;

  final Character character;
  final VoidCallback onPressed;

  const CharacterOption({
    super.key,
    required this.character,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
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
          margin: paddingAllXL,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CharacterImage(character: character),
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
        ),
      ),
    );
  }
}
