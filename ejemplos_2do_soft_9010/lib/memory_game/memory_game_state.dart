import 'package:equatable/equatable.dart';

enum MemoryGameStatus { initial, loading, success, failure }

class MemoryGameState extends Equatable {
  const MemoryGameState({
    required this.status,
    this.error,
  });

  final MemoryGameStatus status;
  final String? error;

  @override
  List<Object?> get props => [status, error];

  MemoryGameState copyWith({
    MemoryGameStatus? status,
    String? error,
  }) {
    return MemoryGameState(
      status: status ?? this.status,
      error: error,
    );
  }
}
