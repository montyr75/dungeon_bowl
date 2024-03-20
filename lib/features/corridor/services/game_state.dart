import '../../../models/active_character.dart';

class GameState {
  final ActiveCharacter character;
  final int frame;

  const GameState({
    required this.character,
    this.frame = 1,
  });

  GameState copyWith({
    ActiveCharacter? character,
    int? frame,
  }) {
    return GameState(
      character: character ?? this.character,
      frame: frame ?? this.frame,
    );
  }
}