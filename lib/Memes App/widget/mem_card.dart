import 'package:flutter/material.dart';

class MemCard extends StatefulWidget {
  final String title;
  final String imagesUrl;
  final int ups;
  final String postLink;
  final Function(Color) onColorExtracted;
  const MemCard({
    super.key,
    required this.title,
    required this.imagesUrl,
    required this.ups,
    required this.postLink,
    required this.onColorExtracted,
  });

  @override
  State<MemCard> createState() => _MemCardState();
}

class _MemCardState extends State<MemCard> {
  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
