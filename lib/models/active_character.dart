import '../data/characters.dart';

class ActiveCharacter {
  final Character character;
  final int gp;

  ActiveCharacter({
    required this.character,
    this.gp = 0,
  });

  ActiveCharacter copyWith({
    Character? character,
    int? gp,
  }) {
    return ActiveCharacter(
      character: character ?? this.character,
      gp: gp ?? this.gp,
    );
  }
}
