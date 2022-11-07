import 'package:flutter/material.dart';
import 'package:run/screens/game_play.dart';

class MainMenu extends StatelessWidget {
  static const routeName = '/main-menu';
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/roads_sprite_sheet.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Text(
                      'Car Rider',
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
                        Navigator.of(context).pushNamed(GamePlay.routeName);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: Text(
                        'Play',
                        style: TextStyle(
                          fontFamily: 'OtraMasStf',
                          fontSize: 30,
                          foreground: Paint()..color = Colors.amber,
                        ).copyWith(
                          shadows: [
                            const Shadow(
                              blurRadius: 120.0,
                              color: Colors.black,
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
                        //TODO Navigating to Options page
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: Text(
                        'Options',
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
            ),
          ),
        ],
      ),
    );
  }
}
