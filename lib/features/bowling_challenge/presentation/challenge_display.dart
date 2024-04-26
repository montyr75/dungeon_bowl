import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/bowling_challenges.dart';
import '../../../utils/popup_utils.dart';
import '../../../utils/screen_utils.dart';
import '../../../widgets/frame_editor.dart';
import '../../../widgets/page_nav_button.dart';
import '../controllers/challenge_ctrl.dart';

class ChallengeDisplay extends ConsumerWidget {
  static const frameWidth = 125.0;
  static const frameHeight = 105.0;
  static const maxWidth = 350.0;

  final BowlingChallenge challenge;
  final int? strength;
  final bool showButtons;
  final VoidCallback onSuccess;
  final VoidCallback onFailure;

  const ChallengeDisplay({
    super.key,
    required this.challenge,
    this.strength,
    this.showButtons = true,
    required this.onSuccess,
    required this.onFailure,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(challengeCtrlProvider);

    final isTenthFrame = challenge is TenthFrameBowlingChallenge;
    final styles = context.textStyles;

    String? thirdThrow;

    if (isTenthFrame) {
      final tenthChallenge = challenge as TenthFrameBowlingChallenge;

      thirdThrow = switch (tenthChallenge.thirdThrow) {
        null => null,
        _ => tenthChallenge.thirdThrow!.toDisplay(strength),
      };
    }

    String? secondThrow = switch (challenge.secondThrow) {
      null => null,
      _ => challenge.secondThrow!.toDisplay(),
    };

    String? firstThrow;

    if (challenge.firstThrow != null) {
      switch (challenge.firstThrow!) {
        case BowlingHit.min1:
        case BowlingHit.min:
          firstThrow = challenge.firstThrow!.toDisplay(strength);
          break;
        case BowlingHit.strike:
          if (!isTenthFrame) {
            secondThrow = challenge.firstThrow!.toDisplay();
          } else {
            firstThrow = challenge.firstThrow!.toDisplay(strength);
          }
          break;
        default:
          break;
      }
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.black54,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      width: frameWidth,
                      height: frameHeight,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (firstThrow != null)
                                  Container(
                                    width: frameWidth * .3,
                                    height: double.infinity,
                                    padding: paddingAllS,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Text(firstThrow),
                                    ),
                                  ),
                                Container(
                                  width: frameWidth * .33,
                                  height: double.infinity,
                                  padding: paddingAllS,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: secondThrow != null
                                      ? FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(secondThrow),
                                        )
                                      : noWidget,
                                ),
                                if (isTenthFrame)
                                  Container(
                                    width: frameWidth * .33,
                                    height: double.infinity,
                                    padding: paddingAllS,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: thirdThrow != null
                                        ? FittedBox(
                                            fit: BoxFit.fill,
                                            child: Text(thirdThrow),
                                          )
                                        : noWidget,
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (challenge.frameTotal != null)
                                  SizedBox(
                                    width: frameWidth * .33,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Text(
                                        challenge.frameTotal!.toDisplay(strength),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: frameHeight,
                        padding: paddingAllM,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2, color: Colors.grey),
                            bottom: BorderSide(width: 2, color: Colors.grey),
                            right: BorderSide(width: 2, color: Colors.grey),
                          ),
                        ),
                        child: Text(
                          challenge.toDisplay(strength),
                          style: styles.bodyLarge.copyWith(height: 1.2),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: sm),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey),
                    ),
                  ),
                  child: isTenthFrame
                      ? const Text(
                          "* For any throw with a requirement, a strike succeeds.",
                          style: TextStyle(fontSize: 10),
                        )
                      : const Text(
                          "* A strike always succeeds.",
                          style: TextStyle(fontSize: 10),
                        ),
                ),
              ],
            ),
          ),
          FrameEditor(
            frame: state.frame,
            onSelected: (ballThrow, value) {
              ref.read(challengeCtrlProvider.notifier).updateThrow(
                ballThrow: ballThrow,
                value: value,
              );
            },
          ),
          if (showButtons) ...[
            boxM,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageNavButton(
                  label: 'Failure',
                  color: ButtonColor.red,
                  onPressed: () {
                    showConfirmDialog(
                      context: context,
                      title: "Failure!",
                      message: "You have failed! Quickly, you turn and run, determined to live to fight another day.",
                      yesMsg: "Confirm Failure",
                      noMsg: "Cancel",
                      onConfirm: onFailure,
                    );
                  },
                ),
                boxXL,
                PageNavButton(
                  label: 'Success',
                  color: ButtonColor.green,
                  onPressed: () {
                    showConfirmDialog(
                      autoDismiss: true,
                      context: context,
                      title: "Success!",
                      message: "You've bested the challenge!",
                      yesMsg: "Confirm Success",
                      noMsg: "Cancel",
                      onConfirm: onSuccess,
                    );
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
