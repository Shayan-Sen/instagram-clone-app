import 'package:flutter/material.dart';
import 'package:projectapp1/models/users.dart';
import 'package:projectapp1/resources/auth_methods.dart';

class UserProvider extends ChangeNotifier {
  Users? _user;
  final AuthMethods _authMethods = AuthMethods();

  Users get getUser => _user!;

  Future<void> refreshUser() async {
    Users user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
