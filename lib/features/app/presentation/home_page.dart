import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../routes.dart';
import '../../../utils/screen_utils.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dungeon Bowl"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          boxXXL,
          TextButton(
            onPressed: () => context.goNamed(AppRoute.characterSelector.name),
            child: const Text('New Game'),
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
    );
  }
}
