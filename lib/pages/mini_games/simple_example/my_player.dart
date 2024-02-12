import 'package:bonfire/bonfire.dart';
import 'package:ditto/shared/player/knight.dart';
import 'package:ditto/shared/util/common_sprite_sheet.dart';
import 'package:ditto/shared/util/player_sprite_sheet.dart';

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
class MyPlayer extends SimplePlayer with BlockMovementCollision {
  MyPlayer(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          size: Vector2.all(32),
          position: position,
          life: 200,
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: size / 2,
        position: size / 4,
      ),
    );
    return super.onLoad();
  }

  // @override
  // void onJoystickAction(JoystickActionEvent event) {
  //   if (hasGameRef && gameRef.sceneBuilderStatus.isRunning) {
  //     return;
  //   }
  //   this.handleJoystickAction(event);
  // }

  // void handleJoystickAction(JoystickActionEvent event) {
  //   /**
  //    * event.event
  //    * DOWN = 조이스틱 터치(누름)
  //    * MOVE = 조이스틱 움직임
  //    * UP = 조이스틱 터치해제(뗌)
  //    */
  //   if (event.event == ActionEvent.DOWN) {
  //     if (event.id == LogicalKeyboardKey.space.keyId ||
  //         event.id == PlayerAttackType.attackMelee) {
  //       if (stamina > 15) {
  //         _decrementStamina(15);
  //         component?.execMeleeAttack(attack);
  //       }
  //     }
  //   }
  //
  //   if (event.id == AttackType.attackRange) {
  //     if (event.event == ActionEvent.MOVE) {
  //       executingRangeAttack = true;
  //       radAngleRangeAttack = event.radAngle;
  //     }
  //     if (event.event == ActionEvent.UP) {
  //       executingRangeAttack = false;
  //     }
  //     component?.execEnableBGRangeAttack(executingRangeAttack, event.radAngle);
  //   }
  // }

  void execMeleeAttack(double attack) {
    simpleAttackMelee(
      damage: attack,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      size: Vector2.all(32),
    );
  }
}

