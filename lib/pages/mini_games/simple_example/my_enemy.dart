import 'package:bonfire/bonfire.dart';
import 'package:ditto/shared/util/common_sprite_sheet.dart';
import 'package:ditto/shared/util/enemy_sprite_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
class MyEnemy extends SimpleEnemy
    with BlockMovementCollision, AutomaticRandomMovement {
  MyEnemy(Vector2 position)
      : super(
          animation: EnemySpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(32),
          life: 100
        );

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size, isSolid: true));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    seeAndMoveToPlayer(
      margin: 10,
      closePlayer: (player) {
        /// do anything when close to player
        execAttack(10);
      },
      radiusVision: 64,
    );
    // runRandomMovement(dt);
  }

  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackMelee(
      size: Vector2.all(width),
      damage: damage / 2,
      interval: 400,
      sizePush: 16,
      animationRight: CommonSpriteSheet.blackAttackEffectRight,
    );
  }

  @override
  void removeLife(double life) {
    showDamage(
      life,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    super.removeLife(life);
  }

  @override
  void die() {
    super.die();
    gameRef.add(
      AnimatedGameObject(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
        size: Vector2.all(32),
      ),
    );
    removeFromParent();
  }
}
