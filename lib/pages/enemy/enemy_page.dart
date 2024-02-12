import 'package:bonfire/bonfire.dart';
import 'package:ditto/pages/enemy/melee_enemy.dart';
import 'package:ditto/pages/enemy/range_enemy.dart';
import 'package:ditto/pages/player/simple/human.dart';
import 'package:flutter/widgets.dart';

class EnemyPage extends StatelessWidget {
  const EnemyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('tiled/punnyworld/simple_map.tmj'),
        objectsBuilder: {
          'range': (properties) => RageEnemy(position: properties.position),
          'melee': (properties) => MeleeEnemy(position: properties.position),
        },
      ),
      joystick: Joystick(
        directional: JoystickDirectional(),
        keyboardConfig: KeyboardConfig(),
      ),
      player: HumanPlayer(
        position: Vector2(tileSize * 7, tileSize * 8),
      ),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
        speed: 5,
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
