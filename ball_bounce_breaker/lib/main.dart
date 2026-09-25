import 'package:ball_bounce_breaker/pages/game_state.dart';
import 'package:flutter/material.dart';
import 'package:ball_bounce_breaker/pages/end_screen.dart';
import 'package:ball_bounce_breaker/pages/game_screen.dart';
import 'package:ball_bounce_breaker/pages/start_screen.dart';

void main() {
  final gameState = GameState();
  gameState.saveScore;
  runApp(MyApp(gameState: gameState));
}

class MyApp extends StatelessWidget {
  final GameState gameState;
  const MyApp({super.key, required this.gameState});

  @override
  Widget build(BuildContext contest) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(gameState: gameState),
        '/game': (context) => GameScreen(gameState: gameState),
        '/end': (context) => EndScreen(gameState: gameState),
      }
    );
  }
  /*Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Page Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(),
        '/game': (context) => const GameScreen(),
        '/end': (context) => const EndScreen(),
      },
    );
  }*/
}

