import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:run/resources/character_component.dart';
import 'package:run/resources/game_world.dart';

class EnemyComponent extends SpriteComponent {
  late final double pos;
  double speed;
  int enemyXPosSetter = 0;
  late final CharacterComponent player;

  EnemyComponent(
    Vector2 enemyPos,
    Sprite sprite,
    size,
    this.player,
    this.speed,
  ) {
    this.sprite = sprite;
    this.size = size;
    position = enemyPos;
    pos = 65;
  }
  GameWorld world = GameWorld();

  bool collision() {
    if ((position.y <= player.position.y &&
        position.y >= (player.position.y - player.size.y) &&
        position.x == player.position.x)) {
      player.health--;
      HapticFeedback.heavyImpact();
      player.gameRef.camera.shake(duration: 0.1, intensity: 2);
      removeFromParent();
      return true;
    }
    return false;
  }

  void reset() {
    debugPrint('removed after ReSet');
  }

  @override
  void update(double dt) {
    if (speed < 1) {
      speed = speed + 1;
    }
    position.y = position.y + 5;
    if (collision()) {
      position.y = -size.y - 20;
      speed = (Random().nextDouble() * 3) * exp(-dt) + 2;
      debugPrint('REMOVED from collision');
    }
    if (position.y > 750) {
      position.y = -size.y - 20;
      enemyXPosSetter = (Random().nextDouble() * 1).ceil();
      speed = (Random().nextDouble() * 3) * exp(-dt) + 2;
      removeFromParent();
      debugPrint('REMOVED from full screen');
    }

    super.update(dt);
  }
}
