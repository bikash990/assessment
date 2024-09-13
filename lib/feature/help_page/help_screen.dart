import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<Map<String, String>> _items = [
    {
      'title': 'Paddy',
      'description':
          'Paddy, small, level, flooded field used to cultivate rice in southern and eastern Asia.',
      'image': ImageConstant.paddy,
    },
    {
      'title': 'Tomato',
      'description':
          'Tomato, a red fruit used as a vegetable in cooking. Tomato, a red fruit used as a vegetable in cooking',
      'image': ImageConstant.tomato,
    },
    {
      'title': 'Potato',
      'description': 'Potato, a starchy root vegetable that is a staple food.',
      'image': ImageConstant.potato,
    },
  ];

  List<Map<String, String>> _filteredItems = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;

    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    setState(() {
      _filteredItems = _items
          .where((item) => item['title']!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                child: TextFormField(
                  controller: _searchController,
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
            children: _filteredItems.map((item) {
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
