import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:run/resources/game_world.dart';

// class GamePlayer extends FlameGame {
//   String playerPath;
//   late final SpriteComponent player;
//   Vector2 worldSize;
//   GamePlayer({required this.playerPath, required this.worldSize});

//   late PlayerComponent characterComponent;

//   void moveUp() {
//     characterComponent.moveUp();
//   }

//   void moveDown() {
//     characterComponent.moveDown();
//   }

//   @override
//   Future<void> onLoad() async {
//     final sprite = await Sprite.load(playerPath);
//     player = SpriteComponent(size: size, sprite: sprite);
//     // characterComponent = PlayerComponent(
//     //   player: player,
//     // );
//     // characterComponent.position = worldSize * 0.57;
//     add(player);
//     return super.onLoad();
//   }
// }

class PlayerComponent extends SpriteComponent {
  bool onTap = true;
  String path;
  late final SpriteComponent player;
  final double gravity = 1.8;
  final Vector2 velocity = Vector2(0, 0);
  double pos = 382;
  PlayerComponent({required this.path});

  @override
  Future<void>? onLoad() async {
    final sprite = await Sprite.load(path);
    player = SpriteComponent(size: size, sprite: sprite);
    position.y = 450;
    pos = position.y;
    position.x = 0;
    add(player);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (position.y < pos) {
      position.y += 2 * gravity;
      print('Position. y ----->>>>> ${position.y}');
    }
    super.update(dt);
  }

  void moveUp() {
    position.y = pos - 200;
    debugPrint('position. y = ${position.y}');
  }

  void moveDown() {
    debugPrint('position. y = ${position.y}');
  }
}
