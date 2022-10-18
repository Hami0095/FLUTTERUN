import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

class GameWorld extends FlameGame {
  late RiveComponent backgroundComponent;

  @override
  Future<void>? onLoad() async {
    Artboard backgroundArtBoard = await loadArtboard(
      RiveFile.asset('assets/images/backgrnd.riv'),
    );
    backgroundComponent = RiveComponent(artboard: backgroundArtBoard);
    backgroundComponent.size = Vector2.all(900);
    var backgroundController = OneShotAnimation('Animation 1', autoplay: true);
    backgroundArtBoard.addController(backgroundController);

    add(backgroundComponent);
    return super.onLoad();
  }
}
