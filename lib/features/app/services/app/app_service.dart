import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/bowler_levels.dart';
import '../../../../data/bowling_tips.dart';
import '../../../../data/characters.dart';
import '../../../../utils/roller.dart';
import 'app_state.dart';

part 'app_service.g.dart';

@Riverpod(keepAlive: true)
class AppService extends _$AppService {
  @override
  AppState build() => const AppState();

  void selectBowlerLevel(BowlerLevel value) {
    state = state.copyWith(
      bowlerLevel: value,
    );
  }

  void selectCharacter(Character value) {
    state = state.copyWith(
      character: value,
    );
  }

  String getBowlingTip() => bowlingTips[rand(bowlingTips.length)];
}
