import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';
import 'package:run/resources/game_world.dart';

import '/resources/game_player.dart';

class MyGame extends FlameGame {
  final GameWorld _world = GameWorld();
  final GamePlayer _character = GamePlayer();

  @override
  Color backgroundColor() => const Color(0xff171717);

  @override
  Future<void>? onLoad() async {
    await add(_world);
    await add(_character);
    _character.characterComponent.position = _world.size * 0.64;
    _character.characterComponent.position.x = 0;

    return super.onLoad();
  }
}
