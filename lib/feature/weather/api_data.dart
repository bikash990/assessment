import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '7383de17a177910fd3587a53494cd22e';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?lat=$lat&lon=$lon&exclude=minutely,alerts&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
