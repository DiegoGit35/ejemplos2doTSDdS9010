import 'package:bloc/bloc.dart';
import 'package:ejemplos_2do_soft_9010/tic_tac_toe/tic_tac_toe_state.dart';

class TicTacToeGame extends Cubit<TicTacToeState> {
  String currentPlayer = 'X';
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  TicTacToeGame()
      : super(const TicTacToeFirstState(
            board: ['', '', '', '', '', '', '', '', ''], currentPlayer: 'X'));

  initGame() {}

  selectCell(int pos) {
    board[pos] = currentPlayer;
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';

    emit(TicTacToeFirstState(board: board, currentPlayer: currentPlayer));
  }
}
