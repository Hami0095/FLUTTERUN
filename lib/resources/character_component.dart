import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class CharacterComponent extends SpriteComponent with HasGameRef {
  late final double
      pos; // helps you to maintain the x-position of the character
  late List<Sprite> spritesList;
  int _currentSpriteIndex = 0;
  bool hasList = false;
  int health = 5;
  ParticleSystemComponent particleSystemComponent = ParticleSystemComponent();
  double movePos;
  CharacterComponent(
      this.movePos, List<Sprite> sprite, size, Vector2 position) {
    spritesList = sprite;
    this.sprite = sprite[0];
    this.size = size;
    this.position = position;
    pos = position.x;
    hasList = true;
  }

  CharacterComponent.withSingleSprite(
      this.movePos, Sprite sprite, size, Vector2 position) {
    this.sprite = sprite;
    this.size = size;
    this.position = position;
    pos = position.x;
    hasList = false;
  }

  Random _random = Random();
  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2(0.5, -1)) * 450;
  }

  @override
  void update(double dt) {
    particleSystemComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 20,
        lifespan: 0.05,
        generator: (i) => AcceleratedParticle(
          speed: getRandomVector(),
          position: position.clone() + Vector2((size.x) / 2, (size.y)),
          child: CircleParticle(
            paint: Paint()..color = const Color.fromARGB(255, 254, 163, 26),
            radius: 2,
            lifespan: 1,
          ),
        ),
      ),
    );

    gameRef.add(particleSystemComponent);

    super.update(dt);
  }

  void reset() {
    health = 5;
  }

  void changeSprite() {
    if (_currentSpriteIndex < spritesList.length) {
      sprite = spritesList[++_currentSpriteIndex];
      debugPrint('agli sprite lagny laggi hai');
    } else {
      debugPrint('Sprites khatam ho gai hain');
    }
  }

  void moveLeft() {
    if (position.x == pos) {
      position.x = pos + movePos;
    }
  }

  void moveRight() {
    if (position.x == pos + movePos) {
      position.x = pos;
    }
  }

  void changePos() {
    if (position.x == pos) {
      position.x = pos + movePos;
    } else {
      position.x = pos;
    }
  }
}
