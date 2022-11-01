import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:run/resources/character_component.dart';

class EnemyComponent extends SpriteComponent {
  late final double pos;
  double speed;
  int enemyXPosSetter = 0;
  late final CharacterComponent player;
  EnemyComponent(
    Sprite sprite,
    size,
    Vector2 position,
    this.player,
    this.speed,
  ) {
    this.sprite = sprite;
    this.size = size;
    this.position = position;
    pos = position.x;
  }

  bool collision() {
    if ((position.y <= player.position.y &&
        position.y >= (player.position.y - player.size.y) &&
        position.x == player.position.x)) {
      player.health--;
      HapticFeedback.heavyImpact();
      removeFromParent();
      debugPrint('REMOVED');
      return true;
    }
    return false;
  }

  // bool agayEnemyHai(){
  //   if(position.y + 30){
  //   }
  //   return false;
  // }

  @override
  void update(double dt) {
    debugPrint('enemy speed = $speed ');
    if (speed < 1) {
      speed = speed + 1;
    }
    position.y = position.y + 5;
    if (collision()) {
      position.y = -size.y - 20;
      speed = (Random().nextDouble() * 3) * exp(-dt) + 2;
    }
    if (position.y > 750) {
      position.y = -size.y - 20;
      enemyXPosSetter = (Random().nextDouble() * 1).ceil();
      speed = (Random().nextDouble() * 3) * exp(-dt) + 2;
      removeFromParent();
      debugPrint('REMOVED from full screen');
    }

    if (enemyXPosSetter == 0) {
      position.x = pos;
    } else {
      position.x = pos + 200;
    }
    super.update(dt);
  }
}
