import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Game Screen')
    ),
    body: Center(
      child: ElevatedButton(
        child: const Text("Finish Game"), 
        onPressed: () {
            Navigator.pushNamed(context, '/end');
          }
      ),
    )
  );
}}