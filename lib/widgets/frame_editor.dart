import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:popover/popover.dart';

import '../models/frame.dart';
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
  final bool showThirdThrow;
  final ScoreOptionSelected onSelected;

  const FrameEditor({
    super.key,
    required this.frame,
    this.showThirdThrow = false,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    Widget? firstThrow;
    Widget? secondThrow;
    Widget? thirdThrow;

    final currentThrow = frame.currentThrow;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThrowBox(
            child: IconButton(
              icon: const Text('1st'),
              onPressed: () {
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
                                _optionSelected(1, option);
                                context.pop();
                              },
                              icon: Text(option),
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
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

  void _optionSelected(int ballThrow, String option) {
    print(option);

    onSelected(ballThrow, switch (option) {
      endash => 0,
      '/' => 10 - (frame.firstThrow ?? 0),
      'X' => 10,
      _ => int.tryParse(option)!,
    });
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
