import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class GamePlayer extends FlameGame {
  late RiveComponent characterComponent;

  @override
  Future<void> onLoad() async {
    Artboard characterArtboard = await loadArtboard(
      RiveFile.asset('assets/images/runner.riv'),
    );
    characterComponent = RiveComponent(artboard: characterArtboard);
    characterComponent.size = Vector2.all(100);
    var characterController = OneShotAnimation('Running', autoplay: true);
    characterArtboard.addController(characterController);
    add(characterComponent);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    characterComponent.position.x = characterComponent.position.x;
    print(characterComponent.position.x);

    super.update(dt);
  }
}
