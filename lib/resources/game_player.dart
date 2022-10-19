import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:run/resources/game_world.dart';

class GamePlayer extends FlameGame {
  String player;
  Vector2 worldSize;
  GamePlayer({required this.player, required this.worldSize});
  @override
  Future<void> onLoad() async {
    Artboard characterArtboard = await loadArtboard(
      RiveFile.asset(player),
    );
    PlayerComponent characterComponent = PlayerComponent(
      playerArtboard: characterArtboard,
    );
    characterComponent.position = worldSize * 0.57;
    var characterController = OneShotAnimation('Animation 1', autoplay: true);
    characterArtboard.addController(characterController);
    add(characterComponent);
    return super.onLoad();
  }
}

class PlayerComponent extends RiveComponent with HasGameRef {
  Artboard playerArtboard;
  PlayerComponent({required this.playerArtboard})
      : super(
          artboard: playerArtboard,
          size: Vector2.all(172),
        );
  @override
  Future<void>? onLoad() {
    position.x = 0;
    return super.onLoad();
  }
}
