import 'package:collection/collection.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:recase/recase.dart';

import '../utils/roll_table.dart';
import '../utils/roller.dart';
import '../utils/utils.dart';
import 'encounters.dart';

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
enum TreasureEffect {
  autoFail(TreasureEffectTiming.encounterEnd),              // Causes automatic failure on a challenge the player is about to succeed on.
  autoSuccess(TreasureEffectTiming.encounterEnd),           // Grants automatic success on a challenge the player is about to fail.
  autoSuccessAll(TreasureEffectTiming.encounterEnd),        // Automatically succeed on all challenges in an encounter.
  crit(TreasureEffectTiming.encounterStart),                // Causes a challenge to be susceptible to a critical hit (a strike that adds extra reward).
  maxReward(TreasureEffectTiming.encounterEnd, 100),        // Guarantees the best possible reward in an encounter.
  none,
  reduceChallenge1(TreasureEffectTiming.encounterStart, 1), // Reduces a bowling challenge by one level.
  reduceChallenge2(TreasureEffectTiming.encounterStart, 2), // Reduces a bowling challenge by two levels.
  rewardMod(TreasureEffectTiming.encounterEnd, 20);         // Adds a mod to an encounter reward's frequency roll.

  final TreasureEffectTiming timing;
  final int? value;

  const TreasureEffect([this.timing = TreasureEffectTiming.none, this.value]);
}

@MappableEnum()
enum TreasureEffectTiming {
  none,
  encounterStart,
  encounterEnd,
}

@MappableEnum()
enum Treasure {
  charmOfSerendipity(
    frequency: Frequency.rare,
    type: TreasureType.item,
    effect: TreasureEffect.maxReward,
    description: "With this magical charm in hand, the fortune of the gods is with you as you loot your foes.",
    narrative: "The Charm of Serendipity radiates warmth in your pocket, and you feel the tingle of good fortune wash over you.",
  ),
  gemOfAnnihilation(
    frequency: Frequency.legendary,
    type: TreasureType.item,
    effect: TreasureEffect.autoSuccessAll,
    description:
        "Stare too deeply into the gem and an unnerving, demonic face stares back! Toss it behind you as you flee for your life and turn failure into success as it blows thine enemies to tiny bits.",
    narrative: "Desperately, facing defeat, you yank the evil Gem of Annihilation out of your pack and fling it over your shoulder as you run. Nothing will survive.",
  ),
  goldCoin1(
    frequency: Frequency.common,
    type: TreasureType.money,
    description: "A shiny gold coin! Perfect for buying things, paying debts, flipping, or winning games.",
    narrative: "You hand over the gold.",
  ),
  goldCoin2(
    frequency: Frequency.uncommon,
    type: TreasureType.money,
    description: "Two shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
    narrative: "You hand over the gold.",
  ),
  goldCoin3(
    frequency: Frequency.rare,
    type: TreasureType.money,
    description: "Three shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
    narrative: "You hand over the gold.",
  ),
  goldCoin4(
    frequency: Frequency.veryRare,
    type: TreasureType.money,
    description: "Four shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
    narrative: "You hand over the gold.",
  ),
  goldCoin5(
    frequency: Frequency.legendary,
    type: TreasureType.money,
    description: "Five shiny gold coins! Perfect for buying things, paying debts, flipping, or winning games.",
    narrative: "You hand over the gold.",
  ),
  hatOfDoom(
    frequency: Frequency.veryRare,
    type: TreasureType.item,
    effect: TreasureEffect.autoFail,
    description: "Curses! This malefic hat locks onto your head, stealing your vigor and weakening your resolve.",
    narrative: "The Hat of Doom tightens on your head, and you feel your strength and will oozing out of you. You cannot achieve your goals under this curse.",
  ),
  luckyCharm(
    frequency: Frequency.uncommon,
    type: TreasureType.item,
    effect: TreasureEffect.rewardMod,
    description: "This shiny trinket bestows the luck of the leprechauns, drawing you toward greater treasures.",
    narrative: "A soft glow emanates from the Lucky Charm, and you're not sure how you know, but you feel luckier.",
  ),
  magicSword(
    frequency: Frequency.common,
    type: TreasureType.item,
    effect: TreasureEffect.autoSuccess,
    targetType: EncounterType.hostile,
    description: "Foes fall easily to this blade, which grants its wielder temporary might.",
    narrative: "Just as you're about to flee, it occurs to you that you have a secret weapon. The Magic Sword appears in your hand, and you cut down the opposition with a gleeful yelp.",
  ),
  ringOfInvisibility(
    frequency: Frequency.common,
    type: TreasureType.item,
    effect: TreasureEffect.autoSuccess,
    targetType: EncounterType.friendly,
    description: "Slip by unnoticed when you place this magical ring on your finger.",
    narrative: "You slide the Ring of Invisibility onto a finger, then gasp as your hand disappears before your eyes. You slink away, undetectable.",
  ),
  ringOfTeleportation(
    frequency: Frequency.common,
    type: TreasureType.item,
    effect: TreasureEffect.autoSuccess,
    targetType: EncounterType.trap,
    description: "Use this ring to warp yourself out of a sticky situation.",
    narrative: "You are about to give up when you remember the Ring of Teleporation. With it, you pop out of existence, only to reappear out of harm's way.",
  ),
  rodOfPersuasion(
    frequency: Frequency.common,
    type: TreasureType.item,
    effect: TreasureEffect.reduceChallenge1,
    targetType: EncounterType.friendly,
    description: "Brandish this rod (benignly) to magically push a creature toward your point of view.",
    narrative: "Your powers of persuasion are lacking this time. A little magical assistance might do the trick, so you point the Rod of Persuasion and ask again. Sucess!",
  ),
  shadowDagger(
    frequency: Frequency.common,
    type: TreasureType.item,
    effect: TreasureEffect.reduceChallenge1,
    targetType: EncounterType.hostile,
    description:
        "Swirling with the dark power of pure shadow, this dagger infects its victims with a malign, magical poison.",
    narrative: "The Shadow Dagger leaks its dark blight into the essence of your opposition. They weaken, bringing victory closer.",
  ),
  shrinkingSpell(
    frequency: Frequency.uncommon,
    type: TreasureType.item,
    effect: TreasureEffect.reduceChallenge2,
    targetType: EncounterType.hostile,
    description: "Read aloud the magical incantation to cast a spell of shrinking on your foe, reducing their terrible potency.",
    narrative: "Quickly, you cast the Shrinking Spell and watch as your opposition is cut down to size.",
  ),
  survivalTools(
    frequency: Frequency.common,
    type: TreasureType.item,
    effect: TreasureEffect.reduceChallenge1,
    targetType: EncounterType.trap,
    description: "These tools of the trade help you bypass traps, puzzles, and hazards with greater ease.",
    narrative: "There's gotta be something helpful in here. Ah! That will make the task easier. Yes... Yes.",
  ),
  vorpalBlade(
    frequency: Frequency.rare,
    type: TreasureType.item,
    effect: TreasureEffect.crit,
    description: "This evil weapon has a tendency to strike true, targeting an enemy's most vulnerable parts.",
    narrative: "The Vorpal Blade guides your hand, urging you to strike true, seeking blood. Do not disappoint it.",
  );

  final Frequency frequency;
  final TreasureType type;
  final TreasureEffect effect;
  final EncounterType? targetType;
  final String description;
  final String narrative;

  const Treasure({
    required this.frequency,
    required this.type,
    this.effect = TreasureEffect.none,
    this.targetType,
    required this.description,
    required this.narrative,
  });

  int get value => frequency.value;

  bool get isMoney => type == TreasureType.money;
  bool get isItem => type == TreasureType.item;
  bool get hasTargetType => targetType != null;

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
    final treasures = Treasure.values.getAllByType(type).where((value) => value.frequency == freq).toList();

    return (treasures..shuffle()).first;
  }

  static Treasure randomGold({int mod = 0, bool isLair = false}) {
    final freq = Frequency.random(mod: mod, isLair: isLair);
    return Treasure.values.getAllByType(TreasureType.money).where((value) => value.frequency == freq).first;
  }
}

extension TreasureListX on List<Treasure> {
  Treasure? getByEffect(TreasureEffect effect) => firstWhereOrNull((value) => value.effect == effect);
  List<Treasure> getAllByType(TreasureType type) => where((value) => value.type == type).toList();
}
