import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  final double _paddlewidth = 100.0;
  final double _paddleheight = 20.0;
  final double _paddleSensitivity = 10.0;
  final double _ballSize = 20.0;
  final double _ballSpeed = 5.0;
  final Color _paddleColor = Colors.white;
  final Color _ballColor = Colors.white;
  final double _paddleXPosition = 0.0;
  final double _paddleYPosition = 0.0;
  final double _ballXPosition = 0.0;
  final double _ballYPosition = 0.0;
  final double _buttonXPosition = 1.0;
  final double _buttonYPosition = 1.0;


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Game Screen')
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: _ballSize,
            height: _ballSize,
            decoration: BoxDecoration(
              color: _ballColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: _paddlewidth,
            height: _paddleheight,
            color: _paddleColor,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            child: const Text("Finish Game"),
            onPressed: () {
              Navigator.pushNamed(context, '/end');
            }
          ),
        ],
      ),
    )
  );
}}