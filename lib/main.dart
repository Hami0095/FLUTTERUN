// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:rive/rive.dart';

void main() {
  final game = FlameGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}
