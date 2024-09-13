import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/feature/help_page/help_screen.dart';
import 'package:agriculture_app/feature/irrigation/irration_screen.dart';
import 'package:agriculture_app/feature/notification/notification_screen.dart';
import 'package:agriculture_app/feature/profile/profile_screen.dart';
import 'package:agriculture_app/feature/weather/weather_screen.dart';
import 'package:agriculture_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6A7C6F).withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: const Color(0xff6A7C6F).withOpacity(0.9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Agro Plan',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 30,
            ),
            Image.asset(
              ImageConstant.frame,
              height: 40,
            )
          ],
        ),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(ImageConstant.argiImage)),
                    Positioned(
                        top: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Enhance your productivity with modern solution",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        )),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffC9D4CC),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 9, horizontal: 13),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                      'Good\n Afternoon\n bikash Today\n weather'),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(ImageConstant.sun),
                              const Text(
                                "20°C  wind: 8 KMPH",
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 15,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff6A7C6F)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 27, horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HelpScreen())),
                            child: Column(
                              children: [
                                Image.asset(ImageConstant.cropFrame),
                                const Text('Crops Management'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => IrrigationScreen())),
                            child: Column(
                              children: [
                                Image.asset(ImageConstant.irrigation),
                                const Text('Irrigation'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProfileScreen())),
                            child: Column(
                              children: [
                                Image.asset(ImageConstant.chart),
                                const Text('Market Information'),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => WeatherScreen())),
                            child: Column(
                              children: [
                                Image.asset(ImageConstant.weather),
                                const Text('Weather'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final Color? color;
  final String name;
  final String image;
  const DrawerItem(
      {super.key, required this.name, required this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Image.asset(image),
        const SizedBox(
          width: 30,
        ),
        Text(
          name,
          style:
              TextStyle(fontSize: 16, color: color ?? const Color(0xff625D5D)),
        )
      ],
    );
  }
}
