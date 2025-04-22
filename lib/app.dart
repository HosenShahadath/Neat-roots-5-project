import 'package:flutter/material.dart';
import 'package:neat_roots_5_project/Calculator%20App/calculator_screen.dart';
import 'package:neat_roots_5_project/Dice%20App/dice_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const CalculatorScreen(),
    );
  }
}