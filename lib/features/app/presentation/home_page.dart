import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';
import '../services/app/app_service.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = context.textStyles;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home2.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              boxXXL,
              Text(
                'Dungeon Bowl',
                style: styles.displayLarge,
              ),
              boxXXL,
              SizedBox(
                width: 150,
                child: TextFormField(
                  style: styles.displayMedium,
                  onChanged: (value) => _submitAverage(ref, value),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: TextInputAction.next,
                  maxLength: 3,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: 'Bowling Average',
                    hintStyle: styles.displaySmall.copyWith(color: Colors.grey),
                    counter: noWidget,
                  ),
                ),
              ),
              boxXXL,
              Consumer(
                builder: (context, ref, child) {
                  return ElevatedButton(
                    onPressed: ref.watch(appServiceProvider).hasValidAverage
                        ? () => context.goNamed(AppRoute.characterSelectionPage.name)
                        : null,
                    child: const Text('New Game'),
                  );
                },
              ),
              // PageNavButton(
              //   label: "TEAMS",
              //   desc: "Build - Modify - Drive",
              //   onPressed: () => context.goNamed(AppRoute.teams.name),
              // ),
              // boxXXL,
              // PageNavButton(
              //   label: "THE PIT",
              //   desc: "Saved Game Snapshots",
              //   onPressed: () => context.goNamed(AppRoute.thePit.name),
              // ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void _submitAverage(WidgetRef ref, String value) {
    if (value.isEmpty) {
      return;
    }

    ref.read(appServiceProvider.notifier).newGame(int.tryParse(value)!);
  }
}
