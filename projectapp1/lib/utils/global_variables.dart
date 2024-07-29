import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp1/screens.dart/add_post_screen.dart';
import 'package:projectapp1/screens.dart/feed_screen.dart';
import 'package:projectapp1/screens.dart/profile_screen.dart';
import 'package:projectapp1/screens.dart/search_screen.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Center(child: Text("notif")),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
