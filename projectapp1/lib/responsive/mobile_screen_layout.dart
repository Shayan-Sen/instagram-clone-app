import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectapp1/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is mobile")),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Colors.white,
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: "Add",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Notifications",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: primaryColor)
        ],
        currentIndex: x,
        onTap: (value) {
          x = value;
        },
      ),
    );
  }
}
