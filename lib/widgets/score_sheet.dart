import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../models/encounter_result.dart';
import '../utils/utils.dart';

const sheetWidth = 360.0;
const sheetHeight = sheetWidth * .1;
const frameWidth = sheetHeight;
const tenthFrameWidth = frameWidth + 10;
const boxSizeFactor = .47;
const tenthFrameBoxSizeFactor = .315;

class ScoreSheet extends StatelessWidget {
  const ScoreSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.textStyles.bodySmall,
      child: Container(
        width: sheetWidth + 12,
        height: sheetHeight,
        decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            FrameBox(
              showBorder: false,
            ),
            for (int i = 1; i < 9; i++)
              FrameBox(
              ),
            FrameBox(
              isTenthFrame: true,
            ),
          ],
        ),
      ),
    );
  }
}

class FrameBox extends StatelessWidget {
  final EncounterResultBase? data;
  final bool isTenthFrame;
  final bool showBorder;

  const FrameBox({
    super.key,
    this.data,
    this.isTenthFrame = false,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final width = !isTenthFrame ? frameWidth : tenthFrameWidth;
    final tbSizeFactor = !isTenthFrame ? boxSizeFactor : tenthFrameBoxSizeFactor;

    return Container(
      width: width,
      height: sheetHeight,
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(
                left: BorderSide(color: Colors.grey, width: 2),
              )
            : null,
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ThrowBox(
                  size: width * tbSizeFactor,
                  showBorder: false,
                  child: Text('8'),
                ),
                ThrowBox(
                  size: width * tbSizeFactor,
                  child: Text('X'),
                ),
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
