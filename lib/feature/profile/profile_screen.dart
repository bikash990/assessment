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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              Text(
                'Real time Market',
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 300,
                  child: MyGraphWidget(
                    weeklySummary: _yearlySummary,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
