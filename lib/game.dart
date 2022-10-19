import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';
import 'package:run/resources/enemy.dart';
import 'package:run/resources/game_world.dart';

import '/resources/game_player.dart';
import 'package:run/resources/enemy.dart';

class MyGame extends FlameGame {
  final GameWorld _world = GameWorld();
  late GamePlayer _character;
  late GameEnemy _enemy;
  @override
  Color backgroundColor() => const Color(0xff171717);

  @override
  Future<void>? onLoad() async {
    await add(_world);
    _character =
        GamePlayer(player: 'assets/images/runner.riv', worldSize: _world.size);
    _enemy =
        GameEnemy(enemy: 'assets/images/enemy.riv', worldSize: _world.size);
    await add(_character);
    await add(_enemy);

    return super.onLoad();
  }
}
