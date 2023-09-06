import 'package:ejemplos_2do_soft_9010/tic_tac_toe/tic_tac_toe.dart';
import 'package:ejemplos_2do_soft_9010/tic_tac_toe/tic_tac_toe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TicTacToePage extends StatelessWidget {
  const TicTacToePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacToeGame, TicTacToeState>(
        listener: (listenerContext, state) {
      if (state.status == TicTacToeStatus.failure) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('¡Lo siento!'),
          backgroundColor: Colors.red,
        ));
      }
    }, builder: (builderContext, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Memoria"),
          ),
          body: Container(
            padding: const EdgeInsets.all(12.0),
            child: LayoutBuilder(builder: (bodyContext, constraints) {
              return Center(
                child: SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxHeight,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(4.0),
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisCount: 3,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      String cell = context.watch<TicTacToeGame>().board[index];
                      print(cell);
                      // print(
                      //     "$index -- ${aTile.isUncovered} // ${aTile.tileIndex}");
                      return Container(
                          decoration: BoxDecoration(

                              // color: aTile.isUncovered
                              //     ? context
                              //         .read<MemoryGameCubit>()
                              //         .boardTiles[aTile.tileIndex]
                              //     : Colors.transparent,
                              border: Border.all(color: Colors.black)),
                          child: SizedBox.expand(
                            child: ElevatedButton(
                              child: Text(
                                cell,
                              ),
                              onPressed: () {
                                context.read<TicTacToeGame>().selectCell(index);
                              },
                            ),
                          ));
                    },
                  ),
                ),
              );
            }),
          ));
    });
  }
}
