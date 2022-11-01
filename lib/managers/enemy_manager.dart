import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:run/resources/character_component.dart';

import '../resources/enemy_component.dart';
import '/resources/game_world.dart';

class EnemyManager extends FlameGame {
  var enemyXPosSetter = 0;
  final GameWorld _world = world;
  late Timer _timer;
  CharacterComponent character;

  Sprite enemySprite;
  EnemyManager(
    this.enemySprite,
    this.character,
  ) : super() {
    _timer = Timer(
      2,
      onTick: _spawnEnemy,
      repeat: true,
      autoStart: false,
    );
  }

  void _spawnEnemy() async {
    final psize = Vector2(100, 150);
    final eSprite = await loadSprite('car2.png');
    double pos = 65;
    final pSprite1 = await loadSprite('car1_1.png');
    double speed = Random().nextDouble() * 5;

    enemyXPosSetter = (Random().nextDouble() * 5).floor();
    debugPrint('EnemyPos setter = $enemyXPosSetter');
    if (enemyXPosSetter == 0) {
      pos = pos;
      debugPrint('pos1 = {$pos}');
    } else {
      pos = pos + 200;
      debugPrint('pos2 = {$pos}');
    }
    EnemyComponent enemy =
        EnemyComponent(eSprite, psize, Vector2(pos, 0), character, speed);
    add(enemy);
  }

  @override
  void onMount() {
    _timer.start();
    super.onMount();
  }

  @override
  void onRemove() {
    _timer.stop();
    super.onRemove();
  }

  @override
  void update(double dt) {
    _timer.update(dt);

    super.update(dt);
  }
}
