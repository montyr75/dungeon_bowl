import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class GoldDisplay extends StatelessWidget {
  final int qty;
  final bool isCompact;

  const GoldDisplay({super.key, required this.qty, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;
    final style = isCompact ? styles.displayMedium : styles.displayLarge;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          qty.toString(),
          style: style.copyWith(color: Colors.yellow),
        ),
        boxS,
        Image.asset(
          'assets/images/gold_coins.png',
          width: isCompact ? 18 : 28,
        ),
      ],
    );
  }
}