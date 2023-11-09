import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ejemplos_2do_soft_9010/memory_game/memory_game_domain.dart';
import 'package:ejemplos_2do_soft_9010/memory_game/memory_game_state.dart';
import 'package:flutter/material.dart';

class MemoryGameCubit extends Cubit<MemoryGameState> {
  int? firstTileSelectedIfAny;
  int? secondTileSelectedIfAny;
  int points = 0;
<<<<<<< HEAD

=======
  final List<Color> boardTiles = [
    Colors.black,
    Colors.orange,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.brown,
    Colors.grey
  ];

  // final List<String> boardTiles = [
  //   "black",
  //   "orange",
  //   "yellow",
  //   "red",
  //   "blue",
  //   "green",
  //   "brown",
  //   "grey"
  // ];
>>>>>>> db2f7f4d70f91144fb238abbcf7f95e5873c4bd7
  List<MemoryGameTile> board = [];
  MemoryGameCubit() : super(const MemoryGameInitialState());

  void initGame({MemoryGameStatus? currentState}) {
    List<int> tileIndexes = [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7];
    board = (tileIndexes..shuffle())
        .map((e) => MemoryGameTile(
              tileIndex: e,
              imagePath: "assets/images/${e + 1}.png",
            ))
        .toList();
    // board = (tileIndexes..shuffle())
    //     .map((e) => MemoryGameTile(tileIndex: e))
    //     .toList();
  }

  void selectTile(int selectedTileIndex) {
    if (firstTileSelectedIfAny == null) {
      firstTileSelectedIfAny = selectedTileIndex;
      board[firstTileSelectedIfAny!].isUncovered = true;
      emit(MemoryGameInitialState(
        firstTileIndex: firstTileSelectedIfAny,
        secondTileIndex: secondTileSelectedIfAny,
      ));
    } else if (secondTileSelectedIfAny == null) {
      if (firstTileSelectedIfAny == selectedTileIndex) {
        return;
      }
      secondTileSelectedIfAny = selectedTileIndex;
      board[secondTileSelectedIfAny!].isUncovered = true;
      emit(MemoryGameInitialState(
        firstTileIndex: firstTileSelectedIfAny,
        secondTileIndex: secondTileSelectedIfAny,
      ));
      Timer(const Duration(seconds: 1), () {
        if (board[firstTileSelectedIfAny!].tileIndex ==
            board[secondTileSelectedIfAny!].tileIndex) {
<<<<<<< HEAD
          emit(const MemoryGameState(status: MemoryGameStatus.success));
          points += 20;
        } else {
          board[firstTileSelectedIfAny!].isUncovered = false;
          board[secondTileSelectedIfAny!].isUncovered = false;
          emit(const MemoryGameState(status: MemoryGameStatus.failure));
          points -= 5;
=======
          emit(const MemoryGameSuccessState(message: "Pareja encontrada!"));
        } else {
          board[firstTileSelectedIfAny!].isUncovered = false;
          board[secondTileSelectedIfAny!].isUncovered = false;
          emit(const MemoryGameFailureState(errorMessage: "No son pareja!"));
>>>>>>> db2f7f4d70f91144fb238abbcf7f95e5873c4bd7
        }

        firstTileSelectedIfAny = null;
        secondTileSelectedIfAny = null;
        emit(MemoryGameInitialState(
          firstTileIndex: firstTileSelectedIfAny,
          secondTileIndex: secondTileSelectedIfAny,
        ));
      });
    }
  }
}

// class PointsCubit extends Cubit<int> {
//   PointsCubit() : super(0);
//   void updatePoints(int gain) => emit(state + gain);
// }
