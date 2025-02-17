import 'package:ejemplos_2do_soft_9010/tic_tac_toe/tic_tac_toe.dart';
import 'package:ejemplos_2do_soft_9010/tic_tac_toe/tic_tac_toe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

//TicTacToePage es la clase de la vista del juego
//si bien cambia su estado, no necesita heredar de
//StatefulWidget porque el estado no lo va a guardar
//en la instancia sino en otra instancia (en el cubit)
class TicTacToePage extends StatelessWidget {
  const TicTacToePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ticTacToeCubit = context.watch<TicTacToeGame>();
    //El widget BlocConsumer es un widget especial cuya función es
    // observar el comportamiento del cubit, es decir, de observar
    //cada vez que cambia su estado para reflejarlo en la vista,
    // ya sea regenerando la vista (en builder:) o realizando alguna
    //acción, como mostrar un mensaje (en listener:).
    //BlocConsumer va a buscar una instancia del cubit con el
    //que esta parametrizado (en este caso TicTacToeGame) en sus
    //los widget superiores (en los widget de los que forma parte)
    // el que va a encontrar va a ser el cubit tictactoeCubit
    // que le asignó el BlocProvider (ver routes.dart)

    return BlocConsumer<TicTacToeGame, TicTacToeState>(
        listener: (listenerContext, state) {
      if (state.status == TicTacToeStatus.failure) {
        //Si el estado es una falla, "casteamos" el estado como
        //TicTacToeFailure y mostramos el error con
        //un SnackBar rojo
        state as TicTacToeFailureState;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.errorMessage),
          backgroundColor: Colors.red,
        ));
      }
      if (state.status == TicTacToeStatus.success) {
        //Si el estado es una notificación positiva, "casteamos" el estado como
        //TicTacToeSuccess y mostramos la notificación con
        //un SnackBar verde
        state as TicTacToeSuccessState;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.notification),
          backgroundColor: Colors.green,
        ));
      }
    }, builder: (builderContext, state) {
      //Si el estado es el "normal" casteamos state  como
      //TicTacToeFirst y redibujamos el tablero
      if (state.status == TicTacToeStatus.first) {
        state as TicTacToeFirstState;
        return Scaffold(
            appBar: AppBar(
              title: const Text("TaTeTí"),
            ),
            body: Container(
              padding: const EdgeInsets.all(12.0),
              child: LayoutBuilder(builder: (bodyContext, constraints) {
                return Center(
                    child: Column(
                  children: [
                    Text(
                      'Player ${ticTacToeCubit.currentPlayer}',
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxWidth,
                      width: constraints.maxWidth,
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
                          //Aca tomamos el valor de cada celda el tablero del estado
                          String cell = state.board[index];
                          return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: index == state.selected
                                          ? Colors.redAccent
                                          : Colors.black,
                                      width: 5)),
                              child: SizedBox.expand(
                                child: ElevatedButton(
                                  child: Text(
                                    cell,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  onPressed: () {
                                    //Acá buscamos un cubit en los widgets superiores (parents)
                                    //el cual sera el tictactoeCubit  y ejecutamos el método
                                    //selectCell(), generando, de este modo, un evento al cubit
                                    //desde la vista
                                    context
                                        .read<TicTacToeGame>()
                                        .selectCell(index);
                                  },
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ));
              }),
            ));
      } else {
        return Container();
      }
    });
  }
}
