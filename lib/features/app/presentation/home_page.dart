import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/banner_title.dart';
import '../../../widgets/bg_bubble.dart';
import '../services/app/app_service.dart';
import 'widgets/page_nav_button.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              boxXXL,
              const MainBannerTitle(title: 'Dungeon Bowl'),
              boxXXL,
              _AverageTextField(
                onChanged: (value) => ref.read(appServiceProvider.notifier).newGame(value),
              ),
              boxXXL,
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(appServiceProvider).hasValidAverage
                      ? PageNavButton(
                        onPressed: () => context.goNamed(AppRoute.characterSelectionPage.name),
                        label: 'Play',
                      ).animate(effects: const [FadeEffect()])
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AverageTextField extends StatelessWidget {
  static const cornerHeight = 50.0;

  final ValueChanged<int> onChanged;

  const _AverageTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return BgBubble(
      child: SizedBox(
        width: 175,
        height: 90,
        child: Stack(
          children: [
            TopLeft(
              child: Image.asset(
                'assets/images/top_corner_border.png',
                height: cornerHeight,
              ),
            ),
            TopRight(
              child: Transform.flip(
                flipX: true,
                child: Image.asset(
                  'assets/images/top_corner_border.png',
                  height: cornerHeight,
                ),
              ),
            ),
            BottomLeft(
              child: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  'assets/images/bottom_corner_border.png',
                  height: cornerHeight,
                ),
              ),
            ),
            BottomRight(
              child: RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                  'assets/images/bottom_corner_border.png',
                  height: cornerHeight,
                ),
              ),
            ),
            TopCenter(
              child: Image.asset(
                'assets/images/top_border.png',
                height: 13,
              ),
            ),
            BottomCenter(
              child: Image.asset(
                'assets/images/top_border.png',
                height: 12,
              ),
            ),
            Align(
              alignment: const Alignment(0.5, -0.7),
              child: TextFormField(
                style: styles.displayLarge,
                onChanged: (value) => onChanged(int.tryParse(value) ?? 0),
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textInputAction: TextInputAction.next,
                maxLength: 3,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Enter Bowling Average',
                  hintStyle: styles.displaySmall,
                  counter: noWidget,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
