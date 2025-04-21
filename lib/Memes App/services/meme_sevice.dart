import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neat_roots_5_project/Memes%20App/models/meme_model.dart';
import 'package:http/http.dart' as http;

class MemeService {
  static Future<List<Meme>?> fetchMemes(BuildContext context) async {
    final url = Uri.parse('https://meme-api.com/gimme/50');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final memes =
            (data['memes'] as List).map((meme) => Meme.fromJson(meme)).toList();
        return memes;
      } else {
        throw Exception('Failed to load memes');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error to memes')));
    }
  }
}
