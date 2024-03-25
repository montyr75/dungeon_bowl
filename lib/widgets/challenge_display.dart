import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../data/bowling_challenges.dart';
import '../utils/screen_utils.dart';

class ChallengeDisplay extends StatelessWidget {
  static const frameSize = 100.0;
  static const maxWidth = 350.0;

  final BowlingChallenge challenge;
  final int? strength;

  const ChallengeDisplay({
    super.key,
    required this.challenge,
    this.strength,
  });

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

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
          secondThrow = challenge.firstThrow!.toDisplay();
          break;
        default:
          break;
      }
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Card(
        color: Colors.black54,
        child: Row(
          children: [
            Container(
              width: frameSize,
              height: frameSize,
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
                            width: frameSize * .4,
                            height: double.infinity,
                            padding: paddingAllS,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(firstThrow),
                            ),
                          ),
                        Container(
                          width: frameSize * .5,
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (challenge.frameTotal != null)
                          SizedBox(
                            width: frameSize * .5,
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
                height: frameSize,
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
                  style: styles.displaySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
