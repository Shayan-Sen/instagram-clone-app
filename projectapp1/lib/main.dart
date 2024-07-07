// ignore_for_file: prefer_const_constructors  Link for infoplist:https://youtu.be/mEPm9w5QlJM?t=5448

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectapp1/firebase_options.dart';
import 'package:projectapp1/providers/user_provider.dart';
import 'package:projectapp1/responsive/mobile_screen_layout.dart';
import 'package:projectapp1/responsive/responsive_layout_screen.dart';
import 'package:projectapp1/responsive/web_screen_layout.dart';
import 'package:projectapp1/screens.dart/login_screen.dart';
// import 'package:projectapp1/screens.dart/signup_screen.dart';
import 'package:projectapp1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Instagram Clone",
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ResponsiveLayout(
                    webScreenLayout: WebScreenLayout(),
                    mobileScreenLayout: MobileScreenLayout());
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
