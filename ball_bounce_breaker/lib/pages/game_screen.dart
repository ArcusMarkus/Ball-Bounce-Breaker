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
  static const double _ballSpeed = 4.0;
  static const Color _paddleColor = Colors.white;
  static const Color _ballColor = Colors.white;

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  Timer? _gameTimer;
  double _paddleX = 0.0;
  double _ballX = 0.0;
  double _ballY = 0.0;
  double _ballSpeedX = _ballSpeed;
  double _ballSpeedY = _ballSpeed;
  Size _screenSize = Size.zero;
  bool _isPlaying = false;

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
    _gameTimer?.cancel();
    super.dispose();
  }

  void _startGame() {
    if (_isPlaying) return;
    setState(() {
      _isPlaying = true;
    });
    _gameTimer = Timer.periodic(const Duration(milliseconds: 16), (_) => _moveBall());
  }

  void _moveBall() {
    if (_screenSize == Size.zero) {
      return; // Skip if the play area size is not yet determined
    }

    setState(() {
      _ballX += _ballSpeedX;
      _ballY += _ballSpeedY;

      if (_ballX <= 0) {
        _ballX = 0;
        _ballSpeedX = -_ballSpeedX;
      } else if (_ballX >= _screenSize.width - _ballSize) {
        _ballX = _screenSize.width - _ballSize;
        _ballSpeedX = -_ballSpeedX;
      }

      if (_ballY <= 0) {
        _ballY = 0;
        _ballSpeedY = -_ballSpeedY;
      } else if (_ballY >= _screenSize.height - _ballSize) {
        _ballY = _screenSize.height - _ballSize;
        _ballSpeedY = -_ballSpeedY;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Game Screen')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = Size(constraints.maxWidth, constraints.maxHeight);
                  if (_screenSize != size) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        if (_screenSize == Size.zero) {
                          _ballX = size.width / 2 - _ballSize / 2;
                          _ballY = size.height / 4;
                        }
                        _screenSize = size;
                      });
                    });
                  }
                  return Stack(
                    children: [
                      Positioned(
                        left: _ballX,
                        top: _ballY,
                        child: Container(
                          width: _ballSize,
                          height: _ballSize,
                          decoration: const BoxDecoration(
                            color: _ballColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(_paddleX, 0.9),
                        child: Container(
                          width: _paddlewidth,
                          height: _paddleheight,
                          decoration: BoxDecoration(
                            color: _paddleColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      if (!_isPlaying)
                        const Center(
                          child: Text(
                            'Tap Start To Begin!',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _isPlaying ? null : _startGame,
                    child: const Text('Start'),
                  ),
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/end'),
                    child: const Text('Finish Game'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}