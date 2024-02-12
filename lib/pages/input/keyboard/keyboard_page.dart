import 'package:bonfire/bonfire.dart';
import 'package:ditto/pages/input/keyboard/barrel_show_keyboard_input.dart';
import 'package:flutter/widgets.dart';

class KeyboardPage extends StatelessWidget {
  const KeyboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('tiled/tiled_example.tmj'),
      ),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 30),
        initPosition: Vector2(tileSize * 5, tileSize * 7),
      ),
      components: [
        BarrelShowKeyboardInput(
          position: Vector2(tileSize * 5, tileSize * 5),
        ),
      ],
    );
  }
}
