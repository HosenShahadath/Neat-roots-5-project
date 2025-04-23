import 'package:flutter/material.dart';
import 'package:neat_roots_5_project/Bmi%20Calculator/bmi_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: BmiScreen(),
    );
  }
}