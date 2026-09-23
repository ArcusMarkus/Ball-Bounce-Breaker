import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ball_bounce_breaker/pages/game_screen.dart';
import 'dart:io';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('End Screen')
    ),
    body: Column(
      children: [
        ElevatedButton(
          child: const Text("Play Again"), 
          onPressed: () {
            Navigator.pushNamed(context, '/game');
          }
        ),
        ElevatedButton(
          child: const Text("Quit"), 
          onPressed: () {
            SystemNavigator.pop();
          }
        )
      ],
    )
  );
}}