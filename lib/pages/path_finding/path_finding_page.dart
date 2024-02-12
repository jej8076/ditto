import 'package:bonfire/bonfire.dart';
import 'package:ditto/pages/path_finding/human_path_finding.dart';
import 'package:flutter/widgets.dart';

class PathFindingPage extends StatelessWidget {
  const PathFindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const tileSize = 16.0;
    return BonfireWidget(
      map: WorldMapByTiled(
        TiledReader.asset('tiled/punnyworld/pathfinding_map.tmj'),
      ),
      player: HumanPathFinding(
        position: Vector2(tileSize * 3, tileSize * 3),
      ),
      cameraConfig: CameraConfig(
        zoom: getZoomFromMaxVisibleTile(context, tileSize, 20),
      ),
      backgroundColor: const Color(0xff20a0b4),
    );
  }
}
