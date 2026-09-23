import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Start Screen')
    ),
    body: Column(
      children: [
        ElevatedButton(
          child: const Text("Start"), 
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
