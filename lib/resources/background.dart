import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Background extends SpriteComponent {
  late final double pos;

  late final player;
  Background(
    Sprite sprite,
    size,
    Vector2 position,
  ) {
    this.sprite = sprite;
    this.size = size;
    this.position = position;
    pos = position.y;
  }

  @override
  void update(double dt) {
    if (position.y <= pos + 5) {
    } else {
      position.y = pos;
    }

    super.update(dt);
  }
}
