import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ScoreSheet extends StatelessWidget {
  static const width = 360.0;
  static const height = width * .1;
  static const tenthFrameWidth = height + 10;

  const ScoreSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.textStyles.bodySmall,
      child: Container(
        width: width + 12,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            FrameBox(size: height, showBorder: false),
            for (int i = 1; i < 9; i++)
              FrameBox(size: height),
            Container(
              width: height + 10,
              height: height,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ThrowBox(size: tenthFrameWidth * .31, showBorder: false, child: Text('X'),),
                        ThrowBox(size: tenthFrameWidth * .32),
                        ThrowBox(size: tenthFrameWidth * .31),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text("255"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FrameBox extends StatelessWidget {
  static const boxSizeFactor = .47;

  final double size;
  final bool showBorder;

  const FrameBox({super.key, required this.size, this.showBorder = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: showBorder ? const Border(
          left: BorderSide(color: Colors.grey, width: 2),
        ) : null,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ThrowBox(size: size * boxSizeFactor, showBorder: false, child: Text('8'),),
                ThrowBox(size: size * boxSizeFactor, child: Text('X'),),
              ],
            ),
          ),
          Expanded(
            child: Text("0"),
          ),
        ],
      ),
    );
  }
}


class ThrowBox extends StatelessWidget {
  final double size;
  final bool showBorder;
  final Widget? child;

  const ThrowBox({super.key, this.size = 54.0, this.showBorder = true, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
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

extension FrameIntX on int? {
  String? toThrowString() {
    return switch (this) {
      null => null,
      0 => endash,
      10 => 'X',
      _ => toString(),
    };
  }
}
