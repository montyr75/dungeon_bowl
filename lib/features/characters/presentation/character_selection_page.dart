import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/characters.dart';
import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../app/services/app/app_service.dart';
import 'character_details_page.dart';
import 'character_image.dart';

class CharacterSelectionPage extends StatelessWidget {
  const CharacterSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () => ref.read(appServiceProvider.notifier).enterRoom(),
                icon: const Icon(Icons.add),
              );
            },
          ),
        ],
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
          child: Row(
            children: [
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}

class CharacterOption extends StatelessWidget {
  static const imageSize = 210.0;

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CharacterImage(character: character),
            BgBubble(
              maxWidth: imageSize,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
          ],
        ),
      ),
    );
  }
}
