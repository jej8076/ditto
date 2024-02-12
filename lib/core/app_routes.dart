import 'package:ditto/pages/enemy/enemy_route.dart';
import 'package:ditto/pages/forces/forces_route.dart';
import 'package:ditto/pages/home/home_route.dart';
import 'package:ditto/pages/lighting/lighting_route.dart';
import 'package:ditto/pages/path_finding/path_finding_route.dart';
import 'package:ditto/pages/player/platform/platform_player_route.dart';
import 'package:ditto/pages/player/simple/simple_player_route.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        ...HomeRoute.builder,
        ...ForcesRoute.builder,
        ...EnemyRoute.builder,
        ...PathFindingRoute.builder,
        ...LightingRoute.builder,
        ...SimplePlayerRoute.builder,
        ...PlatformPlayerRoute.builder,
      };
}
