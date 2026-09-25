import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ball_bounce_breaker/pages/game_screen.dart';
import 'package:ball_bounce_breaker/pages/game_state.dart';
import 'dart:io';

class EndScreen extends StatelessWidget {
 final GameState gameState;

 const EndScreen({super.key, required this.gameState});




  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('End Screen')
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Text("Final Score: ${gameState.score}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 88, 230, 93),
                textStyle: const TextStyle(),
                foregroundColor: Colors.black,
              ), 
              child: const Text("Play Again"),
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.black,
              ),
              child: const Text("Finalize Score"),
              onPressed: (){
                gameState.score = 0;
                Navigator.pushNamed(context, '/');
              },
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
      )
  );
}}