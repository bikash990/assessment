import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/feature/home_page/view/home_screen.dart';
import 'package:agriculture_app/feature/login/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.75),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  ImageConstant.cropImage,
                  height: 80,
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF3EBEB)),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldRow(
                            text: 'Email',
                            isPassword: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter  your email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldRow(
                            text: 'Mobile',
                            isPassword: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter  your mobile number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldRow(
                            text: 'Password',
                            isPassword: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter  your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFieldRow(
                            text: 'Confirm Password',
                            controller: _confirmPasswordController,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter confirm password';
                              }
                              if (value != _passwordController.text) {
                                return 'password and confirm password do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    padding: WidgetStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            horizontal: 35, vertical: 14)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        Color(0xff366842))),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => HomeScreen()));
                                  }
                                },
                                child: const Text(
                                  'Create',
                                  style: TextStyle(color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(ImageConstant.google),
                    Image.asset(ImageConstant.faceBook),
                    Container(
                        height: 33,
                        width: 33,
                        decoration: BoxDecoration(color: Color(0xff0076B2)),
                        child: Image.asset(ImageConstant.linkDin)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
