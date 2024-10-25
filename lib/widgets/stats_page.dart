import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/corridor/services/game_service.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';
import 'bg_bubble.dart';
import 'score_sheet.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.read(gameServiceProvider.notifier).generateReport();
    final encounters = ref.read(gameServiceProvider).encounterHistory.byGame;

    final styles = context.textStyles;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: paddingAllM,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        // ref.read(gameServiceProvider.notifier).showSerialization()
                      },
                      child: Text("Load State"),
                    ),
                    boxXXL,
                    BgBubble(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Success Rate:",
                            style: styles.displayMedium,
                          ),
                          boxM,
                          Text(
                            "${report.percentSuccess}%",
                            style: styles.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    for (final encHist in encounters) ...[
                      boxXXL,
                      ScoreSheet(results: encHist),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
