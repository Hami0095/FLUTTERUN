// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:run/screens/game_play.dart';
import 'package:run/screens/main_menu.dart';
import 'package:run/themes/my_themes.dart';

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
      routes: {
        MainMenu.routeName: (ctx) => const MainMenu(),
        GamePlay.routeName: (ctx) => GamePlay()
      },
      home: const MainMenu(),
      theme: MyThemes.darkTheme,
    ),
  );
}

mixin HorizontalDragGestureRecognizer {}
