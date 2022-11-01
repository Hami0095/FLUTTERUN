// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import '/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  MyGame game = MyGame();

  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: GameWidget(
            game: game,
          ),
        ),
      ),
    ),
  );
}

mixin HorizontalDragGestureRecognizer {}
