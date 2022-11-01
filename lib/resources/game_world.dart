import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

GameWorld world = GameWorld();

class GameWorld extends FlameGame with HasTappables {
  late BackGroundComponent backgroundComponent;

  @override
  Future<void>? onLoad() async {
    Artboard backgroundArtBoard = await loadArtboard(
      RiveFile.asset('assets/images/sarak.riv'),
    );
    backgroundComponent = BackGroundComponent(backgroundArtBoard);
    backgroundComponent.size = Vector2(420, 1000);
    var backgroundController = OneShotAnimation('Timeline 1', autoplay: true);
    backgroundArtBoard.addController(backgroundController);
    add(backgroundComponent);
    return super.onLoad();
  }
}

class BackGroundComponent extends RiveComponent with Tappable {
  Artboard backGroundArtboard;
  BackGroundComponent(this.backGroundArtboard)
      : super(artboard: backGroundArtboard);

  @override
  bool onTapUp(TapUpInfo info) {
    super.onTapUp(info);
    debugPrint("TAP UP");
    debugPrint("Player tapped up on ${info.eventPosition.game}");
    return true;
  }

  @override
  bool onTapDown(TapDownInfo info) {
    debugPrint("TAP DOWN");
    debugPrint("Player tapped up on ${info.eventPosition.game}");
    return super.onTapDown(info);
  }

  @override
  Future<void>? onLoad() {
    position.x = 0;
    return super.onLoad();
  }
}
