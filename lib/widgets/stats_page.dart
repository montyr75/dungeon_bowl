import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/corridor/services/game_service.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';
import 'score_sheet.dart';
import 'success_rate_bubble.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final encounters = ref.read(gameServiceProvider).encounterHistory.byGame;

    return DecoratedBox(
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
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SuccessRateBubble(),
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
          ],
        ),
      ),
    );
  }

  /// Experimenting with making the score sheets horizontally scrollable...
  // @override
  Widget build2(BuildContext context, WidgetRef ref) {
    final encounters = ref.read(gameServiceProvider).encounterHistory.byGame;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: paddingAllM,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SuccessRateBubble(),
                      boxXXL,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final encHist in encounters) ...[
                            boxXXL,
                            SizedBox(
                              height: 55,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ScoreSheet(results: encHist),
                                ],
                              ),
                            ),
                          ],                          ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
