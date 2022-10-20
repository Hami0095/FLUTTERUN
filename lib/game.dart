import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';
import 'package:run/managers/enemy_manager.dart';
import 'package:run/resources/game_enemy.dart';
import 'package:run/resources/game_world.dart';

import '/resources/game_player.dart';
import 'package:run/resources/game_enemy.dart';

class MyGame extends FlameGame {
  final GameWorld _world = world;
  late GamePlayer _character;
  late GameEnemy _enemy;
  late EnemyManager _enemyManager;
  @override
  Color backgroundColor() => const Color(0xff171717);

  @override
  Future<void>? onLoad() async {
    await add(_world);
    _character =
        GamePlayer(player: 'assets/images/hami.riv', worldSize: _world.size);
    _enemy =
        GameEnemy(enemy: 'assets/images/shnoon.riv', worldSize: _world.size);
    _enemyManager = EnemyManager();
    //TODO pass strings for enemy to the manager
    await add(_character);
    // await add(_enemy);
    await add(_enemyManager);

    return super.onLoad();
  }
}
