import 'package:flutter/material.dart';

import '../models/frame.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';

class FrameEditor extends StatelessWidget {
  final Frame frame;
  final bool showThirdThrow;

  const FrameEditor({
    super.key,
    required this.frame,
    this.showThirdThrow = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget? firstThrow;
    Widget? secondThrow;
    Widget? thirdThrow;

    if (frame.isStrike) {
      firstThrow = const Text("X");
    }
    else {
      firstThrow = switch (frame.firstThrow) {
        null => noWidget,
        0 => const Text(endash),
        _ => Text(frame.firstThrow.toString()),
      };
    }

    if (frame.isSpare) {
      secondThrow = const Text("/");
    }
    else {
      secondThrow = switch (frame.secondThrow) {
        null => noWidget,
        0 => const Text(endash),
        _ => Text(frame.secondThrow.toString()),
      };
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThrowBox(
            child: firstThrow,
          ),
          ThrowBox(
            showBorder: true,
            child: secondThrow,
          ),
          if (showThirdThrow)
            ThrowBox(
              showBorder: true,
              child: thirdThrow,
            ),
        ],
      ),
    );
  }
}

class ThrowBox extends StatelessWidget {
  static const boxSize = 48.0;

  final Widget? child;
  final bool showBorder;

  const ThrowBox({super.key, this.child, this.showBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSize,
      height: boxSize,
      alignment: Alignment.center,
      decoration: showBorder
          ? const BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey),
              ),
            )
          : null,
      child: child,
    );
  }
}
