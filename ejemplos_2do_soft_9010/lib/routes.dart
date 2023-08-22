import 'package:ejemplos_2do_soft_9010/home_page.dart';
import 'package:ejemplos_2do_soft_9010/main.dart';
import 'package:ejemplos_2do_soft_9010/memory_game/memory_game_bloc.dart';
import 'package:ejemplos_2do_soft_9010/memory_game/memory_game_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum Pages { menu, memoryGame }

GoRouter examples2ndRouter =
    GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
  GoRoute(
      name: Pages.menu.name,
      path: '/',
      builder: (context, state) {
        return const MenuPage();
      },
      routes: [
        GoRoute(
          name: Pages.memoryGame.name,
          path: 'memory',
          builder: (context, state) {
            return BlocProvider<MemoryGameCubit>.value(
                value: memoryGameCubit, child: const MemoryGamePage());
          },
        ),
      ])
]);
