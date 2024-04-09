import 'package:flutter/material.dart';
import 'package:glowstone/glowstone.dart';

import '../utils/screen_utils.dart';

class BgBubble extends StatelessWidget {
  final double maxWidth;
  final BubbleType? type;
  final Widget child;

  const BgBubble({
    super.key,
    this.maxWidth = 350.0,
    this.type,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 350.0),
      child: Card(
        color: hasType ? null : Colors.black54,
        child: isLair ? Glowstone(
          radius: 200,
          velocity: 2,
          color: Colors.red,
          child: _buildInnerBox(),
        ) : _buildInnerBox(),
      ),
    );
  }

  Widget _buildInnerBox() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(color: Colors.grey, width: 2),
          bottom: BorderSide(color: Colors.grey, width: 2),
        ),
        borderRadius: BorderRadius.circular(12),
        gradient: hasType ? _buildGradient(type!) : null,
      ),
      child: Padding(
        padding: paddingAllM,
        child: child,
      ),
    );
  }

  LinearGradient _buildGradient(BubbleType type) {
    return switch (type) {
      BubbleType.character => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black26,
            Colors.orange[300]!.withOpacity(.35),
            Colors.black54,
            Colors.orange[400]!.withOpacity(.54),
            Colors.black54,
            Colors.orange[600]!.withOpacity(.35),
            Colors.black26,
          ],
        ),
      BubbleType.encounter => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black26,
            Colors.red[400]!.withOpacity(.35),
            Colors.black54,
            Colors.red[600]!.withOpacity(.54),
            Colors.black54,
            Colors.red[800]!.withOpacity(.35),
            Colors.black26,
          ],
        ),
      BubbleType.lairEncounter => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black26,
            Colors.red[400]!.withOpacity(.35),
            Colors.black54,
            Colors.red[600]!.withOpacity(.54),
            Colors.black54,
            Colors.red[800]!.withOpacity(.35),
            Colors.black26,
          ],
        ),
    };
  }

  bool get hasType => type != null;

  bool get isLair => hasType && type == BubbleType.lairEncounter;
}

enum BubbleType {
  character,
  encounter,
  lairEncounter,
}
