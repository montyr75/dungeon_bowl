import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/treasure.dart';
import '../features/corridor/services/game_service.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/popup_utils.dart';
import '../utils/screen_utils.dart';
import 'score_sheet.dart';
import 'success_rate_bubble.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(gameServiceProvider);
    final encounters = state.encounterHistory.byGame;

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
                        boxXXL,
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: sheetWidth),
                          child: Wrap(
                            spacing: med,
                            runSpacing: med,
                            children: state.character.inventory.map((item) {
                              return TreasureButton(
                                treasure: item,
                                onPressed: () {
                                  TreasureDialog.show(item, isInventory: true);
                                },
                              );
                            }).toList(),
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
                          ],
                        ],
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

class TreasureButton extends StatelessWidget {
  final Treasure treasure;
  final VoidCallback onPressed;

  const TreasureButton({
    super.key,
    required this.treasure,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: 75,
          height: 75,
          child: InkWell(
            radius: 100,
            onTap: onPressed,
            child: Ink.image(
              image: AssetImage(treasure.imagePath),
              fit: BoxFit.fill,
              child: BottomCenter(
                child: Container(
                  color: Colors.black38,
                  width: double.infinity,
                  padding: paddingAllS,
                  child: Text(
                    treasure.toString(),
                    style: styles.bodySmall.copyWith(fontWeight: FontWeight.bold, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
