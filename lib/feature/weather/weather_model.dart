class Weather {
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;
  final int visibility;

  Weather({
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      visibility: json['visibility'],
    );
  }
}

class Forecast {
  final DateTime date;
  final Weather weather;

  Forecast({
    required this.date,
    required this.weather,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json.containsKey('dt')
          ? DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)
          : DateTime.now(),
      weather: json.containsKey('main')
          ? Weather.fromJson(json)
          : Weather(
              temperature: 0,
              description: 'Unknown',
              humidity: 0,
              windSpeed: 0,
              visibility: 0,
            ),
    );
  }
}
