import 'package:bonfire/bonfire.dart';
import 'package:ditto/pages/collision/collision_page.dart';
import 'package:ditto/pages/enemy/enemy_page.dart';
import 'package:ditto/pages/forces/forces_page.dart';
import 'package:ditto/pages/home/widgets/drawer/home_drawer.dart';
import 'package:ditto/pages/home/widgets/home_content.dart';
import 'package:ditto/pages/input/drag/drag_gesture_page.dart';
import 'package:ditto/pages/input/keyboard/keyboard_page.dart';
import 'package:ditto/pages/input/mouse/mouse_input_page.dart';
import 'package:ditto/pages/input/move_camera_mouse/move_camera_page.dart';
import 'package:ditto/pages/input/tap/tap_gesture_page.dart';
import 'package:ditto/pages/lighting/lighting_page.dart';
import 'package:ditto/pages/map/terrain_builder/terrain_builder_page.dart';
import 'package:ditto/pages/map/tiled/tiled_network_page.dart';
import 'package:ditto/pages/map/tiled/tiled_page.dart';
import 'package:ditto/pages/mini_games/manual_map/game_manual_map.dart';
import 'package:ditto/pages/mini_games/platform/platform_game.dart';
import 'package:ditto/pages/mini_games/simple_example/simple_example_game.dart';
import 'package:ditto/pages/mini_games/tiled_map/game_tiled_map.dart';
import 'package:ditto/pages/mini_games/top_down_game/top_down_game.dart';
import 'package:ditto/pages/path_finding/path_finding_page.dart';
import 'package:ditto/pages/player/platform/platform_player_page.dart';
import 'package:ditto/pages/player/rotation/rotation_player_page.dart';
import 'package:ditto/pages/player/simple/simple_player_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget content = const HomeContent();
  ItemDrawer? itemSelected;
  late List<SectionDrawer> menu;

  @override
  void initState() {
    menu = _buildMenu();
    itemSelected = menu.first.itens.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Bonfire examples'),
      ),
      drawer: HomeDrawer(
        itemSelected: itemSelected,
        itens: menu,
        onChange: _onChange,
      ),
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: content,
          ),
          // if (itemSelected?.codeUrl.isNotEmpty == true)
          //   Align(
          //     alignment: Alignment.topRight,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: ElevatedButton(
          //         onPressed: () => _launch(itemSelected!.codeUrl),
          //         style: const ButtonStyle(
          //           shape: MaterialStatePropertyAll(
          //             RoundedRectangleBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(20)),
          //             ),
          //           ),
          //         ),
          //         child: const Text(
          //           'Source code',
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   )
        ],
      ),
    );
  }

  void _onChange(ItemDrawer value) {
    setState(() {
      itemSelected = value;
      content = value.builder(context);
    });
  }

  List<SectionDrawer> _buildMenu() {
    return [
      SectionDrawer(
        itens: [
          ItemDrawer(name: 'Home', builder: (_) => const HomeContent()),
        ],
      ),
      SectionDrawer(
        name: 'Mini games',
        itens: [
          ItemDrawer(
            name: 'Simple',
            builder: (_) => const SimpleExampleGame(),
            // builder: (_) => const GameManualMap(),
            codeUrl:
                'https://github.com/RafaelBarbosatec/bonfire/tree/develop/ditto/lib/pages/mini_games',
          ),
        ],
      ),
    ];
  }

  // _launch(String codeUrl) {
  //   launchUrl(Uri.parse(codeUrl));
  // }
}
