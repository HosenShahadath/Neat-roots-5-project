import 'package:flutter/material.dart';
import 'package:neat_roots_5_project/Dice%20App/dice.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.yellow, Colors.orangeAccent, Colors.deepOrange],
            center: Alignment.center,
            radius: 1.5,
          ),
        ),
        child: const Dice(),
      ),
    );
  }
}
