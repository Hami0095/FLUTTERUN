import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:run/resources/character_component.dart';

import '../resources/enemy_component.dart';
import '/resources/game_world.dart';

class EnemyManager extends FlameGame {
  final movePos;
  int enemyXPosSetter = 0;

  final GameWorld _world = world;
  late Timer _timer;
  CharacterComponent character;
  double positionY;
  Sprite enemySprite;
  EnemyManager(
    this.movePos,
    this.positionY,
    this.enemySprite,
    this.character,
  ) : super() {
    _timer = Timer(
      2,
      onTick: _spawnEnemy,
      repeat: true,
      autoStart: false,
    );
    debugPrint('$movePos');
  }

  void _spawnEnemy() async {
    final psizex = size.x / 3.5;
    final psizey = size.y / 4.5;
    final psize = Vector2(psizex, psizey);
    final eSprite = await loadSprite('police.png');
    double pos = 65;
    double speed = Random().nextDouble() * 5;

    enemyXPosSetter = (Random().nextInt(2));
    debugPrint('EnemyPos setter = $enemyXPosSetter');
    if (enemyXPosSetter == 0) {
      pos = pos;
      debugPrint('pos1 = {$pos}');
    } else {
      pos = pos + movePos;
      debugPrint('pos2 = {$pos}');
    }
    debugPrint('ENEMY POS.X : ${pos}');
    EnemyComponent enemy = EnemyComponent(
        Vector2(pos, positionY), eSprite, psize, character, speed);
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
