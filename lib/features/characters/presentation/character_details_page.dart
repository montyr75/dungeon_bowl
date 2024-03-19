import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/characters.dart';
import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../app/presentation/widgets/page_nav_button.dart';
import '../../app/services/app/app_service.dart';
import 'character_image.dart';

class CharacterDetailsPage extends ConsumerWidget {
  static const imageSize = 400.0;

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
                      child: Text(
                        character.toString(),
                        style: styles.displayLarge,
                      ),
                    ),
                    CharacterImage(
                      character: character,
                      size: imageSize,
                    ),
                    BgBubble(
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

class BgBubble extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const BgBubble({
    super.key,
    required this.child,
    this.maxWidth = 400.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingAllM,
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: Colors.black54,
      ),
      child: child,
    );
  }
}