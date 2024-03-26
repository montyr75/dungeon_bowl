import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';

class BgBubble extends StatelessWidget {
  final double maxWidth;
  final Widget child;

  const BgBubble({
    super.key,
    required this.child,
    this.maxWidth = 350.0,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350.0),
      child: Card(
        color: Colors.black54,
        child: Padding(
          padding: paddingAllM,
          child: child,
        ),
      ),
    );
  }
}
