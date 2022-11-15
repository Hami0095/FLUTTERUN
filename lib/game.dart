import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:run/managers/enemy_manager.dart';
import 'package:run/resources/background.dart';
import 'package:run/resources/character_component.dart';

import './resources/enemy_component.dart';
import './resources/game_world.dart';

class MyGame extends FlameGame
    with TapDetector, DoubleTapDetector, HorizontalDragDetector {
  final GameWorld _world = world;
  late final EnemyComponent _enemy;
  late final EnemyComponent _enemy2;
  late final EnemyComponent _enemy3;
  late final CharacterComponent _character;
  late final CharacterComponent _character2;
  late final Background _background;
  GameWorld _gameWorld = world;
  bool pressed = false;
  String direction = 'upward';
  double pos = 65;
  bool running = true;

  double enemyPositionChecker = 0;
  late double movePos;
  bool gameOverFlag = false;
  @override
  Color backgroundColor() => const Color(0xff171717);

  int score = 1;

  TextComponent _playerScore = TextComponent();
  TextComponent gameOverText = TextComponent();
  TextComponent healthText = TextComponent();
  @override
  Future<void>? onLoad() async {
    debugPrint('loading Assets');
    final eSprite = await loadSprite('police.png');
    final bckgSprite = await loadSprite('Bg.png');
    final roadSprite = await loadSprite('Road.png');

    final pSprite1 = await loadSprite('Car.png');
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

    final psize = Vector2(size.x / 4, size.y / 5);
    final bckgSize = Vector2(size.x, size.y);
    final playerPos = Vector2(pos, size.y / 1.4);
    final enemyPosy = -size.y - 10;
    double speed = Random().nextDouble() * 30;
    movePos = size.x / 2.6;
    _character = CharacterComponent.withSingleSprite(
        movePos, pSprite1, psize, playerPos);
    EnemyManager enemyManager =
        EnemyManager(movePos, enemyPosy, eSprite, _character);

    _background = Background(
      bckgSprite,
      Vector2(size.x * 1.6, size.y * 2.5),
      Vector2(-150, -size.y),
    );
    final srak = Background(
      roadSprite,
      Vector2(size.x * 0.75, size.y * 2),
      Vector2(size.x / 9, -100),
    );
    final renderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        backgroundColor: Colors.black,
        fontFamily: 'ShaddedSouth',
      ),
    );
    gameOverText = TextComponent(
      textRenderer: renderer,
      text: 'GAME OVER',
      position: Vector2(size.x - 50, -size.y + 20),
      size: canvasSize,
    );
    _playerScore = TextComponent(
      text: 'Score = $score',
      position: Vector2(size.x / 9, size.y / 99),
      size: Vector2(2, 2),
      textRenderer: renderer,
    );
    healthText = TextComponent(
      textRenderer: renderer,
      text: 'Health = ${_character.health}',
      position: Vector2(size.x / 1.5, size.y / 99),
      size: Vector2(1, 1),
    );

    if (gameOverFlag == true) {
      await add(gameOverText);
    }

    await add(_background);
    await add(srak);
    await add(_character);
    await add(enemyManager);
    await add(_playerScore);
    await add(healthText);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (running == true) {
      score = score + (1 + 0.5).ceil();
    }

    if (_character.health <= 0) {
      // pauseEngine();
      gameOverFlag = true;
    }
    _playerScore.text = 'Score = $score';
    healthText.text = 'Health = ${_character.health}';
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
