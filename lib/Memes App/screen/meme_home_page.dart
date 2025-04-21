import 'package:flutter/material.dart';

import '../models/meme_model.dart';

class MemeHomePage extends StatefulWidget {
  const MemeHomePage({super.key});

  @override
  State<MemeHomePage> createState() => _MemeHomePageState();
}

class _MemeHomePageState extends State<MemeHomePage> {
  List<Meme> memes = [];
  bool isLoading = true;
  Color bacgroundColor = Colors.deepPurple;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meme App'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          ),
        ),
        child:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : memes.isEmpty
                ? Center(child: Text('No Memes Found'))
                : ListView.builder(
                  itemCount: memes.length,
                  itemBuilder: (context, index) {
                    final meme = memes[index];
                  },
                ),
      ),
    );
  }
}
