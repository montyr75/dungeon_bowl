import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app_config.dart';
import '../../../data/bowler_levels.dart';
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
    final state = ref.watch(appServiceProvider);

    final styles = context.textStyles;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_bg.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              boxXXL,
              const MainBannerTitle(title: 'Dungeon Bowl'),
              BgBubble(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<BowlerLevel>(
                    value: state.bowlerLevel,
                    style: styles.displayMedium,
                    focusColor: Colors.transparent,
                    onChanged: (value) => ref.read(appServiceProvider.notifier).selectBowlerLevel(value!),
                    items: BowlerLevel.values.map<DropdownMenuItem<BowlerLevel>>((value) {
                      return DropdownMenuItem<BowlerLevel>(
                        value: value,
                        child: Text("$value (${value.toRange()} average)"),
                      );
                    }).toList(),
                  ),
                ),
              ),
              boxXXL,
              PageNavButton(
                label: 'Play',
                onPressed: () => context.goNamed(AppRoute.characterSelectionPage.name),
              ),
              const Spacer(),
              const BgBubble(
                child: Text("v$version"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
