import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../models/encounter_result.dart';
import '../models/frame.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';

const sheetWidth = 360.0;
const sheetHeight = sheetWidth * .1;
const frameWidth = sheetHeight;
const tenthFrameWidth = frameWidth + 10;
const boxSizeFactor = .47;
const tenthFrameBoxSizeFactor = .315;

class ScoreSheet extends StatelessWidget {
  final List<EncounterResultBase> results;

  const ScoreSheet({super.key, this.results = const []});

  @override
  Widget build(BuildContext context) {
    final List<EncounterResultBase?> data = List.filled(10, null);

    for (int i = 0; i < results.length; i++) {
      data[i] = results[i];
    }

    return DefaultTextStyle(
      style: context.textStyles.bodySmall,
      child: Container(
        width: sheetWidth + 12,
        height: sheetHeight + 17,
        decoration: BoxDecoration(
          color: Colors.black54,
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            FrameBox(
              frame: 1,
              frameData: data.first?.frameData,
              isSuccess: data.first?.isSuccess,
              showBorder: false,
            ),
            for (int i = 1; i < 9; i++)
              FrameBox(
                frame: i + 1,
                frameData: data[i]?.frameData,
                isSuccess: data[i]?.isSuccess,
              ),
            FrameBox(
              frame: 10,
              frameData: data.last?.frameData,
              isSuccess: data.last?.isSuccess,
            ),
          ],
        ),
      ),
    );
  }
}

class FrameBox extends StatelessWidget {
  final int frame;
  final Frame? frameData;
  final bool? isSuccess;
  final bool showBorder;

  bool get isTenthFrame => frame == 10;

  const FrameBox({
    super.key,
    required this.frame,
    this.frameData,
    this.isSuccess,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final width = !isTenthFrame ? frameWidth : tenthFrameWidth;
    final tbSizeFactor = !isTenthFrame ? boxSizeFactor : tenthFrameBoxSizeFactor;

    String? firstThrow;
    String? secondThrow;
    String? thirdThrow;
    TenthFrame? tenthFrame;

    if (frameData != null) {
      if (isTenthFrame) {
        tenthFrame = frameData as TenthFrame;
      }

      firstThrow = frameData!.firstThrow.toThrowString();
      secondThrow = frameData!.isSpare ? '/' : frameData!.secondThrow.toThrowString();

      if (isTenthFrame && tenthFrame!.hasThirdThrow) {
        thirdThrow = tenthFrame.isSpare2 ? '/' : tenthFrame.thirdThrow.toThrowString();
      }
    }

    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                color: switch (isSuccess) {
              null => null,
              true => Colors.green.withOpacity(0.3),
              false => Colors.red.withOpacity(0.3),
            }),
            child: SizedBox(
              width: double.infinity,
              child: Text(frame.toString(), textAlign: TextAlign.center),
            ),
          ),
          boxXS,
          Container(
            width: width,
            height: sheetHeight,
            decoration: BoxDecoration(
              border: Border(
                top: const BorderSide(color: Colors.grey),
                left: showBorder ? const BorderSide(color: Colors.grey, width: 2) : BorderSide.none,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ThrowBox(
                        size: width * tbSizeFactor,
                        showBorder: false,
                        child: firstThrow != null ? Text(firstThrow) : noWidget,
                      ),
                      ThrowBox(
                        size: width * tbSizeFactor,
                        child: secondThrow != null ? Text(secondThrow) : noWidget,
                      ),
                      if (isTenthFrame)
                        ThrowBox(
                          size: width * tbSizeFactor,
                          child: thirdThrow != null ? Text(thirdThrow) : noWidget,
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(frameData?.score.toString() ?? ''),
                ),
              ],
            ),
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
