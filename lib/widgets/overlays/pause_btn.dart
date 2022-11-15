import 'package:flutter/material.dart';

import 'package:run/game.dart';
import 'package:run/widgets/overlays/pause_menu.dart';

class PauseButton extends StatelessWidget {
  static const id = 'pause-btn';
  MyGame gameRef;
  PauseButton({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 45,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(120),
              border: Border.all(color: Theme.of(context).primaryColor),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 112, 112, 112),
                  blurRadius: 1,
                ),
              ],
            ),
            child: TextButton(
              onPressed: () {
                gameRef.pauseEngine();
                gameRef.overlays.add(PauseMenu.routeName);
                gameRef.overlays.remove(PauseButton.id);
              },
              child: const Icon(Icons.pause),
            ),
          ),
        ),
      ],
    );
  }
}
