import 'package:bonfire/bonfire.dart';
import 'package:ditto/pages/input/tap/barrel_tap.dart';
import 'package:flutter/widgets.dart';

class TapGesturePage extends StatelessWidget {
  const TapGesturePage({Key? key}) : super(key: key);

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
        BarrelTap(
          position: Vector2(tileSize * 5, tileSize * 5),
        ),
      ],
    );
  }
}
