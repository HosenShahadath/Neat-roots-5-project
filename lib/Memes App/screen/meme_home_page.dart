import 'package:flutter/material.dart';
import 'package:neat_roots_5_project/Memes%20App/services/meme_sevice.dart';
import 'package:neat_roots_5_project/Memes%20App/widget/meme_card.dart';
import '../models/meme_model.dart';

class MemeHomePage extends StatefulWidget {
  const MemeHomePage({super.key});

  @override
  State<MemeHomePage> createState() => _MemeHomePageState();
}

class _MemeHomePageState extends State<MemeHomePage> {
  List<Meme> memes = [];
  bool isLoading = true;
  Color backgroundColor = Colors.deepPurple;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMemes();
  }

  Future<void> fetchMemes() async {
    final fetchMemes = await MemeService.fetchMemes(context);
    setState(() {
      memes = fetchMemes!;
      isLoading= false;
    });
  }

  void updateBackgroundColor(Color color){
    setState(() {
      backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meme App'),
        centerTitle: true,
        backgroundColor: backgroundColor.withOpacity(0.8),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [backgroundColor.withOpacity(0.8), backgroundColor.withOpacity(0.4)],
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
                    return MemeCard(
                      title: meme.title,
                      imagesUrl: meme.url,
                      ups: meme.ups,
                      postLink: meme.postLink,
                      onColorExtracted: updateBackgroundColor,
                    );
                  },
                ),
      ),
    );
  }
}
