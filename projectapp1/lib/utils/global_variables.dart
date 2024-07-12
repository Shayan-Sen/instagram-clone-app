import 'package:flutter/material.dart';
import 'package:projectapp1/screens.dart/add_post_screen.dart';
import 'package:projectapp1/screens.dart/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Center(child: Text("search")),
  AddPostScreen(),
  Center(child: Text("notif")),
  Center(child: Text("profile")),
];
