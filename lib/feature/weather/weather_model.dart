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
