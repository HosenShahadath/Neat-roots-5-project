import 'package:flutter/material.dart';
import 'package:neat_roots_5_project/Counter_App/counter_app.dart';
import 'First App/first_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const CounterApp(),
    );
  }
}
