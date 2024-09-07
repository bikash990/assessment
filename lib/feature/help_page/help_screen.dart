import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final String description =
      "paddy, small, level, flooded field used to cultivate rice in southern and eastern Asia. Wet-rice cultivation is the most prevalent method of farming in the Far East, where it utilizes a small fraction of the total land yet feeds the majority of the rural population";
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.symmetric(
                          vertical: 5, horizontal: 10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_sharp)),
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
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              DescriptionTextWidget(
                text: description,
                title: 'Paddy',
                image: ImageConstant.paddy,
              ),
              SizedBox(
                height: 14,
              ),
              DescriptionTextWidget(
                text: description,
                title: 'Tomato',
                image: ImageConstant.tomato,
              ),
              SizedBox(
                height: 14,
              ),
              DescriptionTextWidget(
                text: description,
                title: 'Potato',
                image: ImageConstant.potato,
              )
            ],
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
