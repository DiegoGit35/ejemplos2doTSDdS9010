import 'package:bloc/bloc.dart';
import 'package:ejemplos_2do_soft_9010/memory_game/memory_game_state.dart';

class MemoryGameCubit extends Cubit<MemoryGameState> {
  MemoryGameCubit()
      : super(const MemoryGameState(
          status: MemoryGameStatus.initial,
        )) {
    // TODO: implement event handlers
  }
}
