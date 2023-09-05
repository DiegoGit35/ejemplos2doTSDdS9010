import 'package:equatable/equatable.dart';

enum TicTacToeStatus { first, failure }

class TicTacToeState extends Equatable {
  final TicTacToeStatus status;
  const TicTacToeState({required this.status});
  @override
  List<Object?> get props => [status];
}

class TicTacToeFirstState extends TicTacToeState {
  final List<String> board;
  final String currentPlayer;

  const TicTacToeFirstState({required this.board, required this.currentPlayer})
      : super(status: TicTacToeStatus.first);

  @override
  List<Object?> get props => [
        status,
      ];
}
