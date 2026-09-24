import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const double _paddlewidth = 135.0;
  static const double _paddleheight = 10.0;
  static const double _paddleSensitivity = 0.06;
  static const double _ballSize = 20.0;
  static const Color _paddleColor = Colors.white;
  static const Color _ballColor = Colors.white;

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  double _paddleX = 0.0;

  @override
  void initState() {
    super.initState();
    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _paddleX -= event.x * _paddleSensitivity;
        _paddleX = _paddleX.clamp(-1.0, 1.0); // Keep paddle within screen bounds
      });
    });
  }

  @override
  void dispose() {
    _accelerometerSubscription?.cancel();
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Game Screen')),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 4,),
            Container(
              width: _ballSize,
              height: _ballSize,
              decoration: const BoxDecoration(
                color: _ballColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment(_paddleX, 0.0),
                child: Container(
                  width: _paddlewidth,
                  height: _paddleheight,
                  decoration: BoxDecoration(
                    color: _paddleColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1,),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/end'),
                child: const Text('Finish Game'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}