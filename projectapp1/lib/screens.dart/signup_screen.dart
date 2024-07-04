// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectapp1/utils/colors.dart';
import 'package:projectapp1/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              //svg image
              SvgPicture.asset(
                'assets/images/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              SizedBox(
                height: 24,
              ),
              //  a circular widget to show our selected file
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1719822077838-b48bf2c7903d?q=80&w=1930&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_a_photo),
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 24,
              ),
              //text field input:username
              TextFieldInput(
                  textEditingController: _usernameController,
                  hintText: 'Enter your username',
                  textInputType: TextInputType.text),

              SizedBox(
                height: 24,
              ),
              //text field input:email
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress),
              //text field input:password
              SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              SizedBox(
                height: 24,
              ),
              //text field input:bio
              TextFieldInput(
                  textEditingController: _bioController,
                  hintText: 'Enter your bio',
                  textInputType: TextInputType.text),

              SizedBox(
                height: 24,
              ),
              //button login
              InkWell(
                child: Center(
                  child: Container(
                    child: Text("Log In"),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        color: blueColor),
                  ),
                ),
              ),
              //change to sign up
              SizedBox(
                height: 12,
              ),
              Flexible(child: Container(), flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text("Don't have an account?"),
                      padding: EdgeInsets.symmetric(vertical: 8)),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: blueColor),
                          ),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 5)),
                    ),
                  ),
                ],
              ),
              // Flexible(child: Container(), flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
