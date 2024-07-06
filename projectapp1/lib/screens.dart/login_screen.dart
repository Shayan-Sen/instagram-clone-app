// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectapp1/resources/auth_methods.dart';
import 'package:projectapp1/screens.dart/signup_screen.dart';
import 'package:projectapp1/utils/colors.dart';
import 'package:projectapp1/utils/utils.dart';
import 'package:projectapp1/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != "success") {
      showSnackBar(res, context);
    } else {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ,))
    }
  }

  void navigateToSignup() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => SignupScreen(),
    ));
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
                height: 64,
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
              //button login
              InkWell(
                onTap: loginUser,
                child: Container(
                  child: _isLoading
                      ? CircularProgressIndicator(
                          color: primaryColor,
                        )
                      : Text("Log In"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: blueColor),
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
                    onTap: navigateToSignup,
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
