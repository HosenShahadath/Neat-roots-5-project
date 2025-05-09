import 'dart:convert';

import 'package:neat_roots_5_project/Weather%20App/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherServices {
  final String apiKey = '4dfa71d4a0129d1bf66cb38d5bc55812';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=a$apiKey',
    );

    final response = await http.get(url);
    
    if (response.statusCode == 200){
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
