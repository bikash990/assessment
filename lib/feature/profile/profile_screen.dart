import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/feature/bar_graph/bar_graph.dart';
import 'package:agriculture_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<double> _yearlySummary = [
    40.40,
    167.50,
    90.3,
    140.50,
    81.45,
  ];
  List<double> _tomatoSummary = [
    30.5,
    120.0,
    60.3,
    100.0,
    70.45,
  ];

  List<double> _potatoSummary = [
    20.4,
    150.2,
    80.5,
    130.1,
    90.0,
  ];

  String _selectedProduct = "yearly";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6A7C6F).withOpacity(0.6),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff6A7C6F).withOpacity(0.9),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsetsDirectional.symmetric(
                          vertical: 5, horizontal: 10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search_sharp)),
                ),
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
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Real time Market',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
              const Text('Top Sell'),
              Text(
                _selectedProduct == "tomato"
                    ? "Tomato @ 92/20kg"
                    : _selectedProduct == "potato"
                        ? "@ 112/20kg"
                        : "Paddy @120/40kg",
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 300,
                  child: MyGraphWidget(
                    weeklySummary: _selectedProduct == "tomato"
                        ? _tomatoSummary
                        : _selectedProduct == "potato"
                            ? _potatoSummary
                            : _yearlySummary,
                  )),
              const Text('Top buyer'),
              const Text("shree Dev Rice 120/40kg. Liverpool, MSW"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'More we have:',
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.6)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedProduct = "tomato";
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(ImageConstant.tomato),
                            const Text('92/20kg')
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.6)),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedProduct = "potato";
                          });
                        },
                        child: Column(
                          children: [
                            Image.asset(ImageConstant.potato),
                            const Text('112/20kg')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
