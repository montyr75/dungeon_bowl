import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';

import '../models/frame.dart';
import '../utils/screen_utils.dart';
import '../utils/utils.dart';

typedef ScoreOptionSelected = void Function(int ballThrow, int value);

class FrameEditor extends StatelessWidget {
  static const options = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    endash,
    "/",
    "X",
  ];

  final Frame frame;
  final bool isTenthFrame;
  final ScoreOptionSelected onSelected;

  const FrameEditor({
    super.key,
    required this.frame,
    this.isTenthFrame = false,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    String? firstThrow;
    String? secondThrow;
    String? thirdThrow;

    final currentThrow = frame.currentThrow;

    if (currentThrow == null) {
      firstThrow = frame.isStrike ? 'X' : frame.firstThrow.toThrowString();
      secondThrow = frame.isSpare ? '/' : frame.secondThrow.toThrowString();
    } else if (currentThrow == 2) {
      firstThrow = frame.firstThrow.toThrowString();
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThrowBox(
            child: IconButton(
              icon: Text(
                firstThrow ?? '1st',
                style: firstThrow == null ? const TextStyle(fontStyle: FontStyle.italic) : null,
              ),
              onPressed: () => _showSelectionPopup(
                context: context,
                ballThrow: 1,
                options: options.toList()..remove('/'),
              ),
            ),
          ),
          ThrowBox(
            showBorder: true,
            child: !frame.isStrike
                ? IconButton(
                    icon: Text(
                      secondThrow ?? '2nd',
                      style: secondThrow == null ? const TextStyle(fontStyle: FontStyle.italic) : null,
                    ),
                    onPressed: currentThrow == null || currentThrow == 2
                        ? () => _showSelectionPopup(
                              context: context,
                              ballThrow: 2,
                              options: _filterOptions(2),
                            )
                        : null,
                  )
                : noWidget,
          ),
          if (isTenthFrame)
            ThrowBox(
              showBorder: true,
              child: null,
            ),
        ],
      ),
    );
  }

  void _showSelectionPopup({
    required BuildContext context,
    required int ballThrow,
    List<String> options = options,
  }) {
    showPopover(
      context: context,
      backgroundColor: Colors.black54,
      direction: PopoverDirection.top,
      transitionDuration: const Duration(milliseconds: 100),
      bodyBuilder: (context) {
        return Container(
          width: 150,
          height: 175,
          alignment: Alignment.center,
          child: Wrap(
            children: [
              for (final option in options)
                IconButton(
                  onPressed: () {
                    _optionSelected(ballThrow, option);
                    context.pop();
                  },
                  icon: Text(option),
                ),
            ],
          ),
        );
      },
    );
  }

  List<String> _filterOptions(int ballThrow) {
    if (ballThrow == 2) {
      final maxPins = 10 - (frame.firstThrow ?? 0) - 1;
      final result = options.take(maxPins).toList()
        ..add(endash)
        ..add('/');

      return List.unmodifiable(result);
    }

    return const [];
  }

  void _optionSelected(int ballThrow, String option) {
    onSelected(
      ballThrow,
      switch (option) {
        endash => 0,
        '/' => 10 - (frame.firstThrow ?? 0),
        'X' => 10,
        _ => int.tryParse(option)!,
      },
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
