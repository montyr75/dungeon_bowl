import 'package:backdrop/backdrop.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';

import '../features/characters/presentation/character_image.dart';
import '../features/corridor/presentation/bowling_game_frame.dart';
import '../features/corridor/services/game_state.dart';
import '../utils/screen_utils.dart';
import 'gold_display.dart';

AppBar buildGameBar(GameState state) {
  return AppBar(
    toolbarHeight: 65,
    centerTitle: true,
    automaticallyImplyLeading: false,
    flexibleSpace: IntrinsicHeight(
      child: Stack(
        children: [
          CenterLeft(
            child: Padding(
              padding: paddingAllM,
              child: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      final bd = Backdrop.of(context);

                      if (bd.isBackLayerConcealed) {
                        bd.revealBackLayer();
                      } else {
                        bd.concealBackLayer();
                      }
                    },
                    child: CharacterImage(
                      character: state.character.character,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
          ),
          Center(
            child: BowlingGameFrame(
              game: state.game,
              frame: state.frame,
            ),
          ),
          CenterRight(
            child: Padding(
              padding: paddingAllM,
              child: GoldDisplay(
                qty: state.character.gp,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}