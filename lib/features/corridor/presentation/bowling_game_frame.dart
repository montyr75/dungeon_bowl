import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

class BowlingGameFrame extends StatelessWidget {
  final int game;
  final int frame;

  const BowlingGameFrame({super.key, required this.game, required this.frame});

  @override
  Widget build(BuildContext context) {
    final styles = context.textStyles;

    final style = styles.displaySmall;

    return Container(
      width: 1265 * .2,
      height: 404 * .2,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bowling_game_frame.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-.5, .1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Game",
                  style: style,
                ),
                Text(
                  game.toString(),
                  style: style,
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(.5, .1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Frame",
                  style: style,
                ),
                Text(
                  frame.toString(),
                  style: style,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}