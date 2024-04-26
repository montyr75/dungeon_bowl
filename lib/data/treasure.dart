import 'package:recase/recase.dart';

import '../utils/roll_table.dart';
import '../utils/roller.dart';
import '../utils/utils.dart';

const treasureImagePath = 'assets/images/treasure';

enum Treasure {
  shadowDagger(
    frequency: Frequency.uncommon,
    description: "Swirling with the dark power of pure shadow, this dagger infects its victims with a malign poison.",
    instructions:
        "Use this item to succeed on any bowling shot where you failed by 1 pin. Treat a 7 as an 8, a 9 as a strike, a 0 as a 1 or a spare (as appropriate), etc.",
  ),
  gemOfAnnihilation(
    frequency: Frequency.veryRare,
    description:
        "Stare too deeply into it and an unnerving, demonic face stares back! Toss this gem behind you as you flee for your life and turn failure into success, or start with it to guaranty victory.",
    instructions:
        "Use this item to automatically succeed in an encounter, even after your bowling shot, and even if the encounter is multi-frame.",
  ),
  goldCoin1(
    frequency: Frequency.common,
    description: "A shiny gold coin! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin2(
    frequency: Frequency.uncommon,
    description: "Two shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin3(
    frequency: Frequency.rare,
    description: "Three shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin4(
    frequency: Frequency.veryRare,
    description: "Four shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin5(
    frequency: Frequency.crazySauce,
    description: "Five shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  );

  final Frequency frequency;
  final String description;
  final String? instructions;

  const Treasure({
    required this.frequency,
    required this.description,
    this.instructions,
  });

  int get value => frequency.value;

  @override
  String toString() {
    return switch (this) {
      Treasure.gemOfAnnihilation => "Gem of Annihilation",
      Treasure.goldCoin1 => "1 Gold Coin",
      Treasure.goldCoin2 => "2 Gold Coins",
      Treasure.goldCoin3 => "3 Gold Coins",
      Treasure.goldCoin4 => "4 Gold Coins",
      Treasure.goldCoin5 => "5 Gold Coins",
      _ => ReCase(name).titleCase,
    };
  }

  String get imageFile => switch (this) {
        Treasure.goldCoin1 ||
        Treasure.goldCoin2 ||
        Treasure.goldCoin3 ||
        Treasure.goldCoin4 ||
        Treasure.goldCoin5 =>
          "gold_coins.webp",
        _ => "${ReCase(name).snakeCase}.webp",
      };

  String get imagePath => "$treasureImagePath/$imageFile";

  static const goldOnly = [
    Treasure.goldCoin1,
    Treasure.goldCoin2,
    Treasure.goldCoin3,
    Treasure.goldCoin4,
    Treasure.goldCoin5,
  ];

  static Treasure random({int mod = 0, bool isLair = false}) {
    final freq = Frequency.random(mod: mod, isLair: isLair);
    return goldOnly.where((value) => value.frequency == freq).first;
  }
}

enum Frequency {
  common,
  uncommon,
  rare,
  veryRare,
  crazySauce;

  int get value => index + 1;

  static const frequencyTable = RollTable({
    RollRange(1, 50): Frequency.common,
    RollRange(51, 75): Frequency.uncommon,
    RollRange(76, 92): Frequency.rare,
    RollRange(93, 100): Frequency.veryRare,
  });

  static const lairFrequencyTable = RollTable({
    RollRange(1, 65): Frequency.rare,
    RollRange(66, 92): Frequency.veryRare,
    RollRange(93, 100): Frequency.crazySauce,
  });

  static Frequency random({int mod = 0, bool isLair = false}) {
    final rollResult = (roll(100) + mod).maxOf(100);
    final table = !isLair ? frequencyTable : lairFrequencyTable;

    return table.lookup(rollResult)!;
  }
}
