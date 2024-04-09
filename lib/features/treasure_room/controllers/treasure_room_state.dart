import '../../../data/treasure.dart';

class TreasureRoomState {
  final Treasure treasure;
  final bool isClaimed;

  const TreasureRoomState({
    required this.treasure,
    this.isClaimed = false,
  });

  TreasureRoomState copyWith({
    Treasure? treasure,
    bool? isClaimed,
  }) {
    return TreasureRoomState(
      treasure: treasure ?? this.treasure,
      isClaimed: isClaimed ?? this.isClaimed,
    );
  }
}
