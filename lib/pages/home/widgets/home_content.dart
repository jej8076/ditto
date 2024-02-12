import 'package:ditto/core/widgets/bonfire_version.dart';
import 'package:flutter/material.dart';
import 'package:ditto/pages/mini_games/simple_example/simple_example_game.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Text(
                  'What is Bonfire?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleExampleGame(),
                      ),
                    );
                  },
                  child: Text('Go to SimpleExampleGame'),
                ),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: BonfireVersion(),
          ),
        ),
      ],
    );
  }
}
