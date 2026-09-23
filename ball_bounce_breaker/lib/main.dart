import 'package:flutter/material.dart';
import 'package:ball_bounce_breaker/pages/end_screen.dart';
import 'package:ball_bounce_breaker/pages/game_screen.dart';
import 'package:ball_bounce_breaker/pages/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}

