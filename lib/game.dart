import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:run/managers/enemy_manager.dart';
import 'package:run/resources/game_enemy.dart';
import 'package:run/resources/game_world.dart';

import 'package:flutter/services.dart';
import '/resources/game_player.dart';
import 'package:run/resources/game_enemy.dart';

class MyGame extends FlameGame
    with TapDetector, DoubleTapDetector, HasCollisionDetection {
  final GameWorld _world = world;
  late final EnemyComponent _enemy;
  late final CharacterComponent _character;
  late final SpriteComponent _background;
  bool pressed = false;
  String direction = 'upward';
  double pos = 65;
  bool running = true;

  double enemyPositionChecker = 0;
  @override
  Color backgroundColor() => const Color(0xff171717);

  @override
  Future<void>? onLoad() async {
    debugPrint('loading Assets');
    final eSprite = await loadSprite('car2.png');
    final bckgSprite = await loadSprite('roads_sprite_sheet_1.png');
    final pSprite1 = await loadSprite('car1_1.png');
    final pSprite2 = await loadSprite('car1_2.png');
    final pSprite3 = await loadSprite('car1_3.png');
    final pSprite4 = await loadSprite('car1_4.png');
    final pSprite5 = await loadSprite('car1_5.png');
    List<Sprite> playerSprites = [
      pSprite1,
      pSprite2,
      pSprite3,
      pSprite4,
      pSprite5
    ];
    final psize = Vector2(100, 150);
    final bckgSize = Vector2(425, 800);

    double speed = Random().nextDouble() * 30;

    _character =
        CharacterComponent.withSingleSprite(pSprite1, psize, Vector2(pos, 550));
    _enemy = EnemyComponent(eSprite, psize, Vector2(pos, 0), _character);

    _background = SpriteComponent(
      size: bckgSize,
      sprite: bckgSprite,
      position: Vector2(0, 0),
    );

    await add(_background);
    await add(_enemy);
    await add(_character);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    print('UPDATE ==>> pressed = $pressed');
    if (_character.x == _enemy.x && _character.y == (_enemy.y + 150)) {
      HapticFeedback.heavyImpact();
      running = false;
      print('Collided');
    }
    super.update(dt);
  }

  @override
  void onTap() {
    _character.changePos();
    super.onTap();
  }

  @override
  void onDoubleTap() {
    if (running == false) {
      debugPrint('Double Tap');
      resumeEngine();
      running = true;
    } else {
      pauseEngine();
      running = false;
    }
    super.onDoubleTap();
  }
}

class CharacterComponent extends SpriteComponent {
  late final double
      pos; // helps you to maintain the x-position of the character
  late List<Sprite> spritesList;
  int _currentSpriteIndex = 0;
  bool hasList = false;
  CharacterComponent(List<Sprite> sprite, size, Vector2 position) {
    spritesList = sprite;
    this.sprite = sprite[0];
    this.size = size;
    this.position = position;
    pos = position.x;
    hasList = true;
  }
  CharacterComponent.withSingleSprite(Sprite sprite, size, Vector2 position) {
    this.sprite = sprite;
    this.size = size;
    this.position = position;
    pos = position.x;
    hasList = false;
  }
  void changeSprite() {
    if (_currentSpriteIndex < spritesList.length) {
      sprite = spritesList[++_currentSpriteIndex];
      debugPrint('agli sprite lagny laggi hai');
    } else {
      debugPrint('Sprites khatam ho gai hain');
    }
  }

  void changePos() {
    if (position.x == pos) {
      position.x = pos + 200;
    } else {
      position.x = pos;
    }
  }
}

class EnemyComponent extends SpriteComponent {
  late final double pos;
  var enemyXPosSetter = 0.0;
  late final player;
  EnemyComponent(
      Sprite sprite, size, Vector2 position, CharacterComponent yourPlayer) {
    this.sprite = sprite;
    this.size = size;
    this.position = position;
    pos = position.x;
    player = yourPlayer;
  }

  bool collision() {
    if ((position.y <= player.position.y &&
        position.y >= (player.position.y - player.size.y) &&
        position.x == player.position.x)) {
      return true;
    }
    return false;
  }

  @override
  void update(double dt) {
    position.y++;
    if (collision()) {
      position.y = 0;
      debugPrint('Collision hui hai');
    }
    if (position.y > 670) {
      position.y = 0;
      debugPrint('Full Screen hit');
      enemyXPosSetter = Random().nextDouble() * 1;
    }
    if (enemyXPosSetter == 0) {
      position.x = pos;
    } else {
      position.x = pos + 200;
    }
    super.update(dt);
  }
}
