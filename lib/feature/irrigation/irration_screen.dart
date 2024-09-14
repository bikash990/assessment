import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class IrrigationScreen extends StatefulWidget {
  const IrrigationScreen({super.key});

  @override
  State<IrrigationScreen> createState() => _IrrigationScreenState();
}

class _IrrigationScreenState extends State<IrrigationScreen> {
  final List<Map<String, String>> _items = [
    {
      'title': 'Paddy',
      'description':
          "1200-1500 mm water, Flood early, consistent during panicle initation, reduce near maturity. By using flood irrigation or SRI method.",
      'image': ImageConstant.paddy,
    },
    {
      'title': 'Tomato',
      'description':
          '600-00 mm water with moderate early, frequent during flowering and fruit set, reduce near ripening, and drio irrigation ideal method were used',
      'image': ImageConstant.tomato,
    },
    {
      'title': 'Potato',
      'description':
          "500-700 mm water, Light and frequent early, critical during tuber initiation, reduce near harvest. By using drip or furrow method.",
      'image': ImageConstant.potato,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6A7C6F).withOpacity(0.7),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xff6A7C6F).withOpacity(0.9),
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Irrigation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Image.asset(
                  ImageConstant.frame,
                  height: 40,
                ),
              ],
            )),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: _items.map((item) {
              return Column(
                children: [
                  DescriptionTextWidget(
                    text: item['description']!,
                    title: item['title']!,
                    image: item['image']!,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String title;
  final String text;
  final String image;

  DescriptionTextWidget(
      {required this.text, required this.title, required this.image});

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      color: Colors.white,
      child: secondHalf!.isEmpty
          ? Text(firstHalf!)
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 20),
                    ),
                    Image.asset(
                      widget.image,
                    )
                  ],
                ),
                Text(
                  flag ? (firstHalf! + "...") : (firstHalf! + secondHalf!),
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        flag ? "Read more..." : "show less",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
