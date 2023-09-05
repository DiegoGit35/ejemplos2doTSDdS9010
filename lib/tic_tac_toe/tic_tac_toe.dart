import 'package:bloc/bloc.dart';
import 'package:ejemplos_2do_soft_9010/tic_tac_toe/tic_tac_toe_state.dart';

class TicTacToeGame extends Cubit<TicTacToeState> {
  String currentPlayer = '';
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  TicTacToeGame()
      : super(const TicTacToeState(
          status: TicTacToeStatus.first,
        ));

  initGame() {}

  selectCell(int pos) {
    board[pos] = currentPlayer;
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
}
