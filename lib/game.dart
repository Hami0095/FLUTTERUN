import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
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
    _character2 = CharacterComponent(playerSprites, psize, Vector2(pos, 550));
    _enemy = EnemyComponent(
        eSprite, psize, Vector2(pos, -psize.y - 5), _character, speed);
    _enemy2 = EnemyComponent(
        eSprite, psize, Vector2(pos, -psize.y - 5), _character, speed);
    _enemy3 = EnemyComponent(
        eSprite, psize, Vector2(pos, -psize.y - 5), _character, speed);
    List<EnemyComponent> enemiesList = [_enemy, _enemy2, _enemy3];

    _background = Background(
      bckgSprite,
      bckgSize,
      Vector2(0, 0),
    );

    gameOverText = TextComponent(
        text: 'GAME OVER', position: Vector2(500, 500), size: canvasSize);
    _playerScore = TextComponent(
        text: 'Score = $score', position: Vector2(80, 10), size: Vector2(2, 2));
    healthText = TextComponent(
        text: 'Health = ${_character.health}',
        position: Vector2(220, 10),
        size: Vector2(2, 2));
    EnemyManager enemyManager = EnemyManager(eSprite, _character);

    if (gameOverFlag == true) {
      await add(gameOverText);
    }
    await add(_background);
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
      pauseEngine();
      gameOverFlag = true;
    }
    _playerScore.text = 'Score = $score';
    healthText.text = 'Health = ${_character.health}';
  }

  void gameOver() {}

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
