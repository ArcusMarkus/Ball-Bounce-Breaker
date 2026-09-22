import 'package:flutter/material.dart';

class BallBounceBreaker extends StatelessWidget {
  const BallBounceBreaker({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Ball Bounce Breaker')
    ),
    body: Column(
      children: [
        ElevatedButton(
          child: const Text("Start"), 
          onPressed: () {
            // move us to the next screen
          }
        ),
        ElevatedButton(
          child: const Text("Quit"), 
          onPressed: () {
            // closes the game
          }
        )
      ],
    )
  );
}}
