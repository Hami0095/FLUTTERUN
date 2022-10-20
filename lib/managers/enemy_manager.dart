import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

import '/resources/game_enemy.dart';
import '/resources/game_world.dart';

class EnemyManager extends FlameGame {
  final GameWorld _world = world;
  late Timer _timer;
  EnemyManager() : super() {
    _timer = Timer(5, onTick: _spawnEnemy, repeat: true);
  }

  void _spawnEnemy() {
    GameEnemy enemy =
        GameEnemy(enemy: 'assets/images/shnoon.riv', worldSize: _world.size);
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
