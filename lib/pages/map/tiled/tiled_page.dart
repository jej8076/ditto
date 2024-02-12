import 'package:bonfire/bonfire.dart';
import 'package:ditto/shared/decoration/spikes.dart';
import 'package:flutter/material.dart';

class TiledPage extends StatelessWidget {
  const TiledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return BonfireWidget(
      joystick: Joystick(directional: JoystickDirectional()),
      map: WorldMapByTiled(
        TiledReader.asset('tiled/tiled_example.tmj'),
        objectsBuilder: {
          'spikes': (props) => Spikes(
                props.position,
                size: props.size,
              ),
        },
      ),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
        initPosition: Vector2(tileSize * 5, tileSize * 5),
      ),
    );
  }
}
