import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/characters.dart';
import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import 'character_image.dart';

class CharacterDetailsPage extends ConsumerWidget {
  static const imageSize = 400.0;

  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Details'),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(character.bgImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: Column(
            children: [
              CharacterImage(
                character: character,
                size: imageSize,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: imageSize,
                ),
                child: Text(character.description),
              ),
              const Spacer(),
              PageNavButton(
                onPressed: () => null,
                // onPressed: () => context.goNamed(AppRoute.characterSelectionPage.name),
                label: 'Select',
              )
            ],
          ),
        ),
      ),
    );
  }
}
