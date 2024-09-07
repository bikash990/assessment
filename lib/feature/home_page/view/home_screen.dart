import 'package:agriculture_app/constant/image_constant.dart';
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
      backgroundColor: Color(0xff6A7C6F).withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: Color(0xff6A7C6F).withOpacity(0.9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Agro Plan',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 30,
            ),
            Image.asset(
              ImageConstant.frame,
              height: 40,
            )
          ],
        ),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.notification),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.help),
            label: '',
          ),
        ],
      ),
      body: Padding(
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
                      borderRadius: BorderRadius.only(
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
                      color: Color(0xffC9D4CC),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 9, horizontal: 13),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                    'Good\n Afternoon\n bikash Today\n weather'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(ImageConstant.sun),
                            Text(
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
            SizedBox(
              height: 8,
            ),
            Container(
              height: 15,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff6A7C6F)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 27, horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(ImageConstant.cropFrame),
                            Text('Crops Management'),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(ImageConstant.irrigation),
                            Text('Irrigation'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(ImageConstant.chart),
                            Text('Market Information'),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(ImageConstant.weather),
                            Text('Weather'),
                          ],
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
          style: TextStyle(fontSize: 16, color: color ?? Color(0xff625D5D)),
        )
      ],
    );
  }
}
