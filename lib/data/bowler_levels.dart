import '../utils/roll_table.dart';

enum BowlerLevel {
  beginner(
    minAvg: 0,
    maxAvg: 99,
    encounterLevelTable: RollTable<int>({
      RollRange(0, 5): 1,
      RollRange(6, 15): 2,
      RollRange(16, 30): 3,
      RollRange(31, 50): 4,
      RollRange(51, 70): 5,
      RollRange(71, 85): 6,
      RollRange(86, 95): 7,
      RollRange(96, 100): 8,
    }),
  ),
  intermediate(
    minAvg: 100,
    maxAvg: 149,
    challengeMod: 1,
    encounterLevelTable: RollTable<int>({
      RollRange(0, 2): 1,
      RollRange(3, 7): 2,
      RollRange(8, 17): 3,
      RollRange(18, 32): 4,
      RollRange(33, 54): 5,
      RollRange(55, 76): 6,
      RollRange(77, 91): 7,
      RollRange(92, 100): 8,
    }),
  ),
  advanced(
    minAvg: 150,
    maxAvg: 199,
    challengeMod: 2,
    encounterLevelTable: RollTable<int>({
      RollRange(0, 3): 2,
      RollRange(4, 9): 3,
      RollRange(10, 19): 4,
      RollRange(20, 35): 5,
      RollRange(36, 60): 6,
      RollRange(61, 85): 7,
      RollRange(86, 100): 8,
    }),
  ),
  pro(
    minAvg: 200,
    maxAvg: 300,
    challengeMod: 3,
    encounterLevelTable: RollTable<int>({
      RollRange(0, 3): 3,
      RollRange(4, 10): 4,
      RollRange(11, 25): 5,
      RollRange(26, 50): 6,
      RollRange(51, 75): 7,
      RollRange(76, 100): 8,
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
}

final bowlerLevelTable = RollTable<BowlerLevel>({
  RollRange(BowlerLevel.beginner.minAvg, BowlerLevel.beginner.maxAvg): BowlerLevel.beginner,
  RollRange(BowlerLevel.intermediate.minAvg, BowlerLevel.intermediate.maxAvg): BowlerLevel.intermediate,
  RollRange(BowlerLevel.advanced.minAvg, BowlerLevel.advanced.maxAvg): BowlerLevel.advanced,
  RollRange(BowlerLevel.pro.minAvg, BowlerLevel.pro.maxAvg): BowlerLevel.pro,
});