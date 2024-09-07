import 'package:flutter/material.dart';

class TextFieldRow extends StatelessWidget {
  final String text;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  const TextFieldRow({
    super.key,
    required this.text,
    required this.isPassword,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            validator: validator,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: isPassword,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              fillColor: Color(0xffFFFFFF),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                    color: const Color.fromARGB(255, 206, 204, 204),
                    width: 1.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
