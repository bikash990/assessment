import 'dart:convert';

import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/feature/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final String username =
        (context.findAncestorWidgetOfExactType<BottomNavigationScreen>()
                as BottomNavigationScreen)
            .username;
    return SafeArea(
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(ImageConstant.frame),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [Text(username), Icon(Icons.arrow_drop_down)],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'OPTIONS',
                style: TextStyle(fontSize: 16, color: Color(0xff646060)),
              ),
              const SizedBox(height: 40),
              const DrawerItem(
                name: 'Settings',
                image: ImageConstant.setting,
              ),
              const SizedBox(height: 20),
              const DrawerItem(
                name: 'Change Password',
                color: Colors.black,
                image: ImageConstant.changePassword,
              ),
              const SizedBox(height: 20),
              const DrawerItem(
                name: 'Log out',
                image: ImageConstant.logOut,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
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
          style: TextStyle(fontSize: 16, color: color ?? Color(0xff625D5D)),
        )
      ],
    );
  }
}
