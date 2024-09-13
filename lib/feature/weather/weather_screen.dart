import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/feature/weather/api_data.dart';
import 'package:agriculture_app/feature/weather/weather_model.dart';
import 'package:agriculture_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();

  Weather? _weather;
  bool _isLoading = false;
  final double _latitude = -33.8688; // Example latitude (San Francisco)
  final double _longitude = 151.2093;

  void _fetchWeather() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final weatherData =
          await _weatherService.fetchWeather(_latitude, _longitude);

      setState(() {
        _weather = Weather.fromJson(weatherData);
        // _forecasts = forecasts;
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Create a DateFormat for "Friday, Sep 13"
    DateFormat dateFormat = DateFormat('EEEE, MMM d');
    String formattedDate = dateFormat.format(now);

    return Scaffold(
      backgroundColor: const Color(0xff6A7C6F).withOpacity(0.9),
      drawer: const DrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Text("weather"),
        ),
        backgroundColor: const Color(0xff6A7C6F).withOpacity(0.7),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : _weather == null
                  ? const Text('No data')
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Sydney',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          formattedDate,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${_weather!.temperature} °C',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${_weather!.description}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(ImageConstant.wind),
                                  Image.asset(ImageConstant.humidity),
                                  Image.asset(ImageConstant.visibility),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '${_weather!.windSpeed} m/s\nwind',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${_weather!.windSpeed} %\nhumidity',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${_weather!.visibility / 1000} km\nvisibility',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 25),
                              decoration: const BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageConstant.rainy,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _weather!.description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const Text(
                                    "18 c",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 25),
                              decoration: const BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageConstant.rainy,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _weather!.description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const Text(
                                    "18 c",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 25),
                              decoration: const BoxDecoration(
                                  color: Color(0xffD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageConstant.rainy,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _weather!.description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const Text(
                                    "18 c",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Tommorrow',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Tuesday',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
        ),
      ),
    );
  }
}
