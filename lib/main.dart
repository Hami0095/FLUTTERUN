// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import '/game.dart';

void main() {
  MyGame game = MyGame();
  runApp(
    GameWidget(
      game: game,
    ),
  );
}
