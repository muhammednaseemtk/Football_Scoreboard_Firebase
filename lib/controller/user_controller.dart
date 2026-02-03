import 'package:flutter/material.dart';
import 'package:football_scoreboard/model/user_model.dart';
import 'package:football_scoreboard/service/user_service.dart';

class UserController with ChangeNotifier {
  UserModel? users;

  final UserService userService = UserService();

  UserModel? get user => users;

  Future<void> loaddUser(String uid) async {
    users = await userService.getUser(uid);
    notifyListeners();
  }

  Future<void> createUser(UserModel user) async {
    await userService.crUser(user);
    users = user;
    notifyListeners();
  }

  void clearuser() {
    users = null;
    notifyListeners();
  }
}