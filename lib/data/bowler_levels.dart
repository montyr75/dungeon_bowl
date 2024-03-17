import '../utils/roll_table.dart';
import '../utils/roller.dart';
import 'encounters.dart';

enum BowlerLevel {
  beginner(
    minAvg: 0,
    maxAvg: 99,
    encounterLevelTable: RollTable<int>({
      RollRange(1, 15): 1,
      RollRange(16, 33): 2,
      RollRange(34, 53): 3,
      RollRange(54, 70): 4,
      RollRange(71, 82): 5,
      RollRange(83, 92): 6,
      RollRange(93, 98): 7,
      RollRange(99, 100): 8,
    }),
  ),
  intermediate(
    minAvg: 100,
    maxAvg: 149,
    challengeMod: 1,
    encounterLevelTable: RollTable<int>({
      RollRange(1, 5): 1,
      RollRange(6, 18): 2,
      RollRange(19, 35): 3,
      RollRange(36, 57): 4,
      RollRange(58, 73): 5,
      RollRange(74, 85): 6,
      RollRange(86, 95): 7,
      RollRange(96, 100): 8,
    }),
  ),
  advanced(
    minAvg: 150,
    maxAvg: 199,
    challengeMod: 2,
    encounterLevelTable: RollTable<int>({
      RollRange(1, 5): 2,
      RollRange(6, 17): 3,
      RollRange(18, 37): 4,
      RollRange(38, 59): 5,
      RollRange(60, 78): 6,
      RollRange(79, 90): 7,
      RollRange(91, 100): 8,
    }),
  ),
  pro(
    minAvg: 200,
    maxAvg: 300,
    challengeMod: 3,
    encounterLevelTable: RollTable<int>({
      RollRange(0, 5): 3,
      RollRange(6, 23): 4,
      RollRange(24, 43): 5,
      RollRange(44, 65): 6,
      RollRange(66, 84): 7,
      RollRange(85, 100): 8,
    }),
  );

  final int minAvg;
  final int maxAvg;
  final int challengeMod;
  final RollTable<int> encounterLevelTable;

  const BowlerLevel({
    required this.minAvg,
    required this.maxAvg,
    this.challengeMod = 0,
    required this.encounterLevelTable,
  });

  String generateEncounter() {
    final lvl = encounterLevelTable.lookup(roll(100))!;
    final challenge = generateBowlingChallenge(lvl, this);

    return '''
Level: $lvl
Challenge: ${challenge.description}
''';
  }
}

final bowlerLevelTable = RollTable<BowlerLevel>({
  RollRange(BowlerLevel.beginner.minAvg, BowlerLevel.beginner.maxAvg): BowlerLevel.beginner,
  RollRange(BowlerLevel.intermediate.minAvg, BowlerLevel.intermediate.maxAvg): BowlerLevel.intermediate,
  RollRange(BowlerLevel.advanced.minAvg, BowlerLevel.advanced.maxAvg): BowlerLevel.advanced,
  RollRange(BowlerLevel.pro.minAvg, BowlerLevel.pro.maxAvg): BowlerLevel.pro,
});