import 'package:dart_mappable/dart_mappable.dart';
import 'package:recase/recase.dart';

import '../utils/roll_table.dart';
import '../utils/roller.dart';
import '../utils/utils.dart';

part 'treasure.mapper.dart';

const treasureImagePath = 'assets/images/treasure';

@MappableEnum()
enum Frequency {
  common,
  uncommon,
  rare,
  veryRare,
  legendary;

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
    RollRange(93, 100): Frequency.legendary,
  });

  static Frequency random({int mod = 0, bool isLair = false}) {
    final rollResult = (roll(100) + mod).maxOf(100);
    final table = !isLair ? frequencyTable : lairFrequencyTable;

    return table.lookup(rollResult)!;
  }

  @override
  String toString() => ReCase(name).sentenceCase.toLowerCase();
}

@MappableEnum()
enum TreasureType {
  money,
  item;

  static const typeTable = RollTable({
    RollRange(1, 79): TreasureType.money,
    RollRange(80, 100): TreasureType.item,
  });

  static TreasureType random() => typeTable.lookup(roll(100))!;
}

@MappableEnum()
enum Treasure {
  charmOfSerendipity(
    frequency: Frequency.rare,
    type: TreasureType.item,
    description: "With this magical charm in hand, the fortune of the gods is with you as you loot your foes.",
    effect: "Guarantees the best possible reward in an encounter.",
  ),
  gemOfAnnihilation(
    frequency: Frequency.legendary,
    type: TreasureType.item,
    description:
        "Stare too deeply into the gem and an unnerving, demonic face stares back! Toss it behind you as you flee for your life and turn failure into success as it blows thine enemies to tiny bits.",
    effect: "Automatically succeed on all challenges in an encounter.",
  ),
  goldCoin1(
    frequency: Frequency.common,
    type: TreasureType.money,
    description: "A shiny gold coin! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin2(
    frequency: Frequency.uncommon,
    type: TreasureType.money,
    description: "Two shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin3(
    frequency: Frequency.rare,
    type: TreasureType.money,
    description: "Three shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin4(
    frequency: Frequency.veryRare,
    type: TreasureType.money,
    description: "Four shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  goldCoin5(
    frequency: Frequency.legendary,
    type: TreasureType.money,
    description: "Five shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
  ),
  hatOfDoom(
    frequency: Frequency.veryRare,
    type: TreasureType.item,
    description: "Curses! This malefic hat locks onto your head, stealing your vigor and weakening your resolve.",
    effect: "Causes automatic failure on a challenge the player is about to succeed on.",
  ),
  luckyCharm(
    frequency: Frequency.uncommon,
    type: TreasureType.item,
    description: "This shiny trinket bestows the luck of the leprechauns, drawing you toward greater treasures.",
    effect: "Adds a mod to an encounter reward's frequency roll.",
  ),
  magicSword(
    frequency: Frequency.common,
    type: TreasureType.item,
    description: "Foes fall easily to this blade, which grants its wielder temporary might.",
    effect: "Grants automatic success on a hostile challenge the player is about to fail.",
  ),
  ringOfInvisibility(
    frequency: Frequency.common,
    type: TreasureType.item,
    description: "Slip by unnoticed when you place this magical ring on your finger.",
    effect: "Grants automatic success on a friendly challenge the player is about to fail.",
  ),
  ringOfTeleportation(
    frequency: Frequency.common,
    type: TreasureType.item,
    description: "Use this ring to warp yourself out of a sticky situation.",
    effect: "Grants automatic success on a trap challenge the player is about to fail.",
  ),
  rodOfPersuasion(
    frequency: Frequency.common,
    type: TreasureType.item,
    description: "Brandish this rod (benignly) to magically push a creature toward your point of view.",
    effect: "Reduces a friendly bowling challenge by one level.",
  ),
  shadowDagger(
    frequency: Frequency.common,
    type: TreasureType.item,
    description:
        "Swirling with the dark power of pure shadow, this dagger infects its victims with a malign, magical poison.",
    effect: "Reduces a hostile bowling challenge by one level.",
  ),
  shrinkingSpell(
    frequency: Frequency.uncommon,
    type: TreasureType.item,
    description: "Read aloud the magical incantation to cast a spell of shrinking on your foe, reducing their terrible potency.",
    effect: "Reduces a hostile bowling challenge by two levels.",
  ),
  survivalTools(
    frequency: Frequency.common,
    type: TreasureType.item,
    description: "These tools of the trade help you bypass traps, puzzles, and hazards with greater ease.",
    effect: "Reduces a trap bowling challenge by one level.",
  ),
  vorpalBlade(
    frequency: Frequency.rare,
    type: TreasureType.item,
    description: "This evil weapon has a tendency to strike true, targeting an enemy's most vulnerable parts.",
    effect: "Causes a challenge to be susceptible to a critical hit (a strike that adds extra reward).",
  );

  final Frequency frequency;
  final TreasureType type;
  final String description;
  final String? effect;

  const Treasure({
    required this.frequency,
    required this.type,
    required this.description,
    this.effect,
  });

  int get value => frequency.value;

  bool get isMoney => type == TreasureType.money;
  bool get isItem => type == TreasureType.item;

  @override
  String toString() {
    return switch (this) {
      Treasure.gemOfAnnihilation => "Gem of Annihilation",
      Treasure.goldCoin1 => "1 Gold Coin",
      Treasure.goldCoin2 => "2 Gold Coins",
      Treasure.goldCoin3 => "3 Gold Coins",
      Treasure.goldCoin4 => "4 Gold Coins",
      Treasure.goldCoin5 => "5 Gold Coins",
      Treasure.ringOfInvisibility => "Ring of Invisibility",
      Treasure.ringOfTeleportation => "Ring of Teleportation",
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

  static Treasure random({int mod = 0, bool isLair = false}) {
    final freq = Frequency.random(mod: mod, isLair: isLair);
    final type = TreasureType.random();
    final treasures = Treasure.values.getByType(type).where((value) => value.frequency == freq).toList();

    return (treasures..shuffle()).first;
  }

  static Treasure randomGold({int mod = 0, bool isLair = false}) {
    final freq = Frequency.random(mod: mod, isLair: isLair);
    return Treasure.values.getByType(TreasureType.money).where((value) => value.frequency == freq).first;
  }
}

extension TreasureListX on List<Treasure> {
  List<Treasure> getByType(TreasureType type) => where((value) => value.type == type).toList();
}
