import 'package:flutter/material.dart';

import 'package:run/game.dart';
import 'package:run/screens/main_menu.dart';
import 'package:run/widgets/overlays/pause_btn.dart';

import '../../screens/game_play.dart';

class PauseMenu extends StatelessWidget {
  static const routeName = 'pausemenu';
  MyGame gameRef;
  PauseMenu({
    Key? key,
    required this.gameRef,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              'Paused Menu',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                shadows: [
                  const Shadow(
                    blurRadius: 200.0,
                    color: Colors.amber,
                  ),
                  const Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              onPressed: () {
                gameRef.resumeEngine();
                gameRef.overlays.remove(PauseMenu.routeName);
                gameRef.overlays.add(PauseButton.id);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                'Resume',
                style: TextStyle(
                  fontFamily: 'OtraMasStf',
                  fontSize: 30,
                  foreground: Paint()..color = Colors.amber,
                ).copyWith(
                  shadows: [
                    const Shadow(
                      blurRadius: 120.0,
                      color: Colors.transparent,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(MainMenu.routeName);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
              child: Text(
                'Exit',
                style: TextStyle(
                  fontFamily: 'OtraMasStf',
                  fontSize: 30,
                  foreground: Paint()..color = Colors.amber,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
