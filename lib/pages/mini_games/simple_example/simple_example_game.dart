import 'package:bonfire/bonfire.dart';
import 'package:ditto/pages/mini_games/simple_example/my_enemy.dart';
import 'package:ditto/pages/mini_games/simple_example/my_player.dart';
import 'package:ditto/shared/decoration/barrel_dragable.dart';
import 'package:ditto/shared/decoration/potion_life.dart';
import 'package:ditto/shared/interface/knight_interface.dart';
import 'package:ditto/shared/player/knight.dart';
import 'package:flutter/material.dart';

///
/// Created by
///
/// ─▄▀─▄▀
/// ──▀──▀
/// █▀▀▀▀▀█▄
/// █░░░░░█─█
/// ▀▄▄▄▄▄▀▀
///
/// Rafaelbarbosatec
/// on 19/10/21
class SimpleExampleGame extends StatelessWidget {
  const SimpleExampleGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(),
        directional: JoystickDirectional(),
        actions: [
          JoystickAction(
            actionId: PlayerAttackType.attackMelee,
            sprite: Sprite.load('joystick_atack.png'),
            align: JoystickActionAlign.BOTTOM_RIGHT,
            size: 80,
            margin: const EdgeInsets.only(bottom: 50, right: 50),
          ),
          JoystickAction(
            actionId: PlayerAttackType.attackRange,
            sprite: Sprite.load('joystick_atack_range.png'),
            spriteBackgroundDirection: Sprite.load('joystick_background.png'),
            size: 50,
            enableDirection: true,
            margin: const EdgeInsets.only(bottom: 50, right: 160),
          )
        ],
      ),
      map: WorldMapByTiled(
        TiledReader.asset('tiled/mapa2.json'),
        forceTileSize: Vector2.all(32),
        objectsBuilder: {
          'goblin': (properties) => MyEnemy(properties.position),
          'spawn': (properties) => ComponentSpawner(
                position: properties.position,
                area: properties.area,
                interval: 500,
                builder: (position) {
                  return PotionLife(position, 1, size: Vector2.all(10));
                },
                spawnCondition: (game) {
                  return game.query<PotionLife>().length < 10;
                },
              ),
        },
      ),
      components: [
        BarrelDraggable(Vector2(300, 150)),
      ],
      // player: MyPlayer(Vector2(140, 140)),
      player: Knight(Vector2(140, 140)),
      interface: KnightInterface(),
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: getZoomFromMaxVisibleTile(context, 32, 15),
      ),
      backgroundColor: const Color.fromARGB(255, 10, 53, 89),
    );
  }
}
