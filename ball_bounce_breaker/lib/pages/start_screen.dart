import 'package:ball_bounce_breaker/pages/game_state.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class StartScreen extends StatelessWidget {
  final GameState gameState;

  const StartScreen({super.key, required this.gameState});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Start Screen')
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Top 5 Scores",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Column(
            children: gameState.highScores.map((score){
              return Text(
                score.toString(),
                style: const TextStyle(fontSize: 20, color: Colors.black),
              );
            }).toList(),
          ),
          const Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 88, 230, 93),
                textStyle: const TextStyle(),
                foregroundColor: Colors.black,
              ), 
            child: const Text("Play"), 
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            }
          ),
             ElevatedButton(
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                textStyle: const TextStyle(), 
                foregroundColor: Colors.black,
              ), 
              child: const Text("Quit"), 
               onPressed: () {
                SystemNavigator.pop();
              }
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
