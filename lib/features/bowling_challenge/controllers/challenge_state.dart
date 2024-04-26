import '../../../models/frame.dart';

class ChallengeState {
  final Frame frame;
  final bool isSuccess;

  const ChallengeState({
    this.frame = const Frame(),
    this.isSuccess = false,
  });

  ChallengeState copyWith({
    Frame? frame,
    bool? isSuccess,
  }) {
    return ChallengeState(
      frame: frame ?? this.frame,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}