import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/corridor/services/game_service.dart';
import '../utils/screen_utils.dart';
import 'bg_bubble.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.read(gameServiceProvider.notifier).generateReport();

    final styles = context.textStyles;

    return Container(
      color: Colors.black,
      child: Center(
        child: BgBubble(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Rooms Defeated: ${report.encountersWon} / ${report.totalEncounters} (${report.percentEncountersWon}%)",
                style: styles.displayMedium,
              ),
              boxM,
              Text(
                "Lairs Defeated: ${report.lairsWon} / ${report.totalLairs} (${report.percentLairEncountersWon}%)",
                style: styles.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}