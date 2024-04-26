import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/characters.dart';
import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/bg_bubble.dart';
import '../../../widgets/page_nav_button.dart';
import '../../app/services/app/app_service.dart';
import 'character_image.dart';

class CharacterDetailsPage extends ConsumerWidget {
  static const imageSize = 250.0;

  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = context.textStyles;

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
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    BgBubble(
                      type: BubbleType.character,
                      child: Text(
                        character.toString(),
                        style: styles.displayLarge,
                      ),
                    ),
                    boxM,
                    CharacterImage(
                      character: character,
                      size: imageSize,
                    ),
                    boxM,
                    if (character.description.isNotEmpty) BgBubble(
                      child: Text(
                        character.description,
                        style: styles.displaySmall,
                      ),
                    ),
                    const Spacer(),
                    PageNavButton(
                      onPressed: () {
                        ref.read(appServiceProvider.notifier).selectCharacter(character);
                        context.goNamed(AppRoute.corridor.name);
                      },
                      label: 'Select',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
