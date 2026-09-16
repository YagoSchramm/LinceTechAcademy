import 'package:flutter/material.dart';

enum GeniusColor {
  green(Colors.green, 0),
  red(Colors.red, 1),
  yellow(Colors.yellow, 2),
  blue(Colors.blue, 3);

  const GeniusColor(this.color, this.i);

  final Color color;
  final int i;
}
enum GameResult {
  none,
  won,
  lost,
}

enum GameState {
  idle,
  showingSequence,
  playerTurn,
  gameOver,
}

enum GameMode {
  easy(
    duration: Duration.zero,
  ),

  medium(
    duration: Duration(seconds: 5),
  ),

  hard(
    duration: Duration(seconds: 3),
  );

  const GameMode({
    required this.duration,
  });

  final Duration duration;

  bool get hasTimer => duration > Duration.zero;
}