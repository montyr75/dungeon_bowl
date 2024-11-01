import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../data/treasure.dart';
import '../utils/screen_utils.dart';
import 'gold_display.dart';

class TreasureDisplay extends StatelessWidget {
  final Treasure treasure;

  const TreasureDisplay({super.key, required this.treasure});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    return Row(
      children: [
        TreasureImage(treasure: treasure),
        boxM,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(treasure.toString(), style: styles.displayMedium),
                  GoldDisplay(qty: treasure.value, isCompact: true),
                ],
              ),
              const Divider(color: Colors.white54),
              Text(treasure.description, style: styles.displaySmall),
              const Divider(color: Colors.white54),
              Text(
                treasure.frequency.toString(),
                style: styles.bodySmall.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TreasureImage extends StatelessWidget {
  final Treasure treasure;

  const TreasureImage({super.key, required this.treasure});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(treasure.imagePath),
      ),
    );
  }
}
