import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
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
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: ListView(
            children: Character.values
                .map(
                  (character) => CharacterOption2(
                character: character,
                onPressed: () => context.goNamed(AppRoute.characterDetails.name, extra: character),
              ),
            )
                .toList(),
          ),
          // child: Row(
          //   children: [
          //     Expanded(
          //       child: GridView.count(
          //         crossAxisCount: 2,
          //         children: Character.values
          //             .map(
          //               (character) => CharacterOption(
          //                 character: character,
          //                 onPressed: () => context.goNamed(AppRoute.characterDetails.name, extra: character),
          //               ),
          //             )
          //             .toList(),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

class CharacterOption2 extends StatelessWidget {
  static const imageSize = 135.0;

  final Character character;
  final VoidCallback onPressed;

  const CharacterOption2({
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
        child: Card(
          color: Colors.transparent,
          child: Padding(
            padding: paddingAllM,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CharacterImage(
                        character: character,
                        size: imageSize,
                      ),
                    ],
                  ),
                  boxM,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.toString(),
                          style: styles.displayMedium,
                        ),
                        boxS,
                        Text(
                          "${character.race} ${character.profession}",
                          style: styles.displaySmall,
                        ),
                        const Divider(color: Colors.white54),
                        Text(
                          character.description,
                          style: styles.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
