import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:run/resources/game_world.dart';

class GameEnemy extends FlameGame {
  String enemy;
  Vector2 worldSize;
  GameEnemy({required this.enemy, required this.worldSize});
  late EnemyComponent characterComponent;
  @override
  Future<void> onLoad() async {
    Artboard characterArtboard = await loadArtboard(
      RiveFile.asset(enemy),
    );
    characterComponent = EnemyComponent(
      playerArtboard: characterArtboard,
    );
    characterComponent.position = worldSize * 0.54;
    characterComponent.position.x = worldSize.x == 360 ? worldSize.x : 360;
    var characterController = OneShotAnimation('Animation 1', autoplay: true);
    characterArtboard.addController(characterController);
    add(characterComponent);
    return super.onLoad();
  }
}

class EnemyComponent extends RiveComponent with HasGameRef {
  Artboard playerArtboard;
  EnemyComponent({required this.playerArtboard})
      : super(
          artboard: playerArtboard,
          size: Vector2.all(200),
        );

  @override
  void update(double dt) {
    super.update(dt);
    if (x == -120) {
      removeFromParent();
    }
    x = x - 1;
    debugPrint("$x");
  }
}
