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
  @override
  Future<void> onLoad() async {
    Artboard characterArtboard = await loadArtboard(
      RiveFile.asset(enemy),
    );
    EnemyComponent characterComponent = EnemyComponent(
      playerArtboard: characterArtboard,
    );
    characterComponent.position = worldSize * 0.615;
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
          size: Vector2.all(100),
        );
  @override
  Future<void>? onLoad() {
    position.x = 50;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    x = x;
    debugPrint("$x");
  }
}
