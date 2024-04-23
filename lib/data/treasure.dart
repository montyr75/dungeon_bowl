import 'package:recase/recase.dart';

import '../utils/roll_table.dart';
import '../utils/roller.dart';
import '../utils/utils.dart';

const treasureImagePath = 'assets/images/treasure';

enum Treasure {
  shadowDagger(
    frequency: Frequency.uncommon,
    value: 3,
    description: "Swirling with the dark power of pure shadow, this dagger infects its victims with a dark poison.",
    use:
        "Use this item to succeed on any bowling shot where you failed by 1 pin. Treat a 7 as an 8, a 9 as a strike, a 0 as a 1 or a spare (as appropriate), etc.",
  ),
  gemOfAnnihilation(
    frequency: Frequency.veryRare,
    value: 5,
    description:
        "Stare too deeply into it and an unnerving, demonic face stares back! Toss this gem behind you as you flee for your life and turn failure into success, or start with it to guaranty victory.",
    use:
        "Use this item to automatically succeed in an encounter, even after your bowling shot, and even if the encounter is multi-frame.",
  ),
  goldCoin1(
    frequency: Frequency.common,
    value: 1,
    description: "A shiny gold coin! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin2(
    frequency: Frequency.uncommon,
    value: 2,
    description: "Two shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin3(
    frequency: Frequency.rare,
    value: 3,
    description: "Three shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin4(
    frequency: Frequency.veryRare,
    value: 4,
    description: "Four shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  );

  final Frequency frequency;
  final int value;
  final String description;
  final String? use;

  const Treasure({required this.frequency, required this.value, required this.description, this.use});

  @override
  String toString() {
    return switch (this) {
      Treasure.gemOfAnnihilation => "Gem of Annihilation",
      Treasure.goldCoin1 => "1 Gold Coin",
      Treasure.goldCoin2 => "2 Gold Coins",
      Treasure.goldCoin3 => "3 Gold Coins",
      Treasure.goldCoin4 => "4 Gold Coins",
      _ => ReCase(name).titleCase,
    };
  }

  String get imageFile => switch (this) {
        Treasure.goldCoin1 || Treasure.goldCoin2 || Treasure.goldCoin3 || Treasure.goldCoin4 => "gold_coins.webp",
        _ => "${ReCase(name).snakeCase}.webp",
      };

  String get imagePath => "$treasureImagePath/$imageFile";

  static const goldOnly = [
    Treasure.goldCoin1,
    Treasure.goldCoin2,
    Treasure.goldCoin3,
    Treasure.goldCoin4,
  ];

  static Treasure random({int mod = 0}) {
    final freq = Frequency.random(mod: mod);
    return goldOnly.where((value) => value.frequency == freq).first;
  }
}

enum Frequency {
  common,
  uncommon,
  rare,
  veryRare;

  static const frequencyTable = RollTable({
    RollRange(1, 50): Frequency.common,
    RollRange(51, 75): Frequency.uncommon,
    RollRange(76, 92): Frequency.rare,
    RollRange(93, 100): Frequency.veryRare,
  });

  static Frequency random({int mod = 0}) => frequencyTable.lookup((roll(100) + mod).maxOf(100))!;
}
