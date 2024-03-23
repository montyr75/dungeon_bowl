import '../../../models/active_character.dart';

class GameState {
  final ActiveCharacter character;
  final int game;
  final int frame;

  const GameState({
    required this.character,
    this.game = 1,
    this.frame = 1,
  });

  GameState copyWith({
    ActiveCharacter? character,
    int? game,
    int? frame,
  }) {
    return GameState(
      character: character ?? this.character,
      game: game ?? this.game,
      frame: frame ?? this.frame,
    );
  }
}