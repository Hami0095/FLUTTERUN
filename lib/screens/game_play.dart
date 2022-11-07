import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:run/widgets/overlays/pause_btn.dart';

import '../game.dart';

class GamePlay extends StatelessWidget {
  static const routeName = '/game-play';
  GamePlay({super.key});

  MyGame game = MyGame();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GameWidget(
        game: game,
        initialActiveOverlays: const [PauseButton.id],
        overlayBuilderMap: {
          PauseButton.id: (BuildContext context, MyGame gameRef) =>
              const PauseButton(),
        },
      ),
    );
  }
}
