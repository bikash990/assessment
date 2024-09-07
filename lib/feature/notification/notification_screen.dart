import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Card(
                color: Color(0xffD9D9D9),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'the week is full of rain. check your drainage. And next week use vitamins',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
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
