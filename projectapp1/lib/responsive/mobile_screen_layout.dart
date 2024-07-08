import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectapp1/utils/colors.dart';
import 'package:projectapp1/utils/global_variables.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int x = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onIndexChanged(int value) {
    setState(() {
      x = value;
      pageController.jumpToPage(value);
    });
  }

  void onPageChanged(int page) {
    setState(() {
      x = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
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
        onTap: onIndexChanged,
      ),
    );
  }
}
