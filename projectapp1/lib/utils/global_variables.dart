import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectapp1/screens/add_post_screen.dart';
import 'package:projectapp1/screens/feed_screen.dart';
import 'package:projectapp1/screens/profile_screen.dart';
import 'package:projectapp1/screens/search_screen.dart';

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
