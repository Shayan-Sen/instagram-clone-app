// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectapp1/resources/auth_methods.dart';
import 'package:projectapp1/screens.dart/login_screen.dart';
import 'package:projectapp1/utils/colors.dart';
import 'package:projectapp1/utils/utils.dart';
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
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signupUser(
        email: _emailController.text,
        bio: _bioController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        file: _image!);

    setState(() {
      _isLoading = false;
    });

    if (res != "success") {
      showSnackBar(res, context);
    } else {
      navigateToLogin();
    }
  }

  void navigateToLogin() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginScreen(),
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
                height: 24,
              ),
              //  a circular widget to show our selected file
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
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
                onTap: signupUser,
                child: Container(
                  child: _isLoading
                      ? CircularProgressIndicator(
                          color: primaryColor,
                        )
                      : Text("Sign Up"),
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
                      child: Text("Account already exists?"),
                      padding: EdgeInsets.symmetric(vertical: 8)),
                  GestureDetector(
                    onTap: navigateToLogin,
                    child: Center(
                      child: Container(
                          child: Text(
                            "Login",
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
