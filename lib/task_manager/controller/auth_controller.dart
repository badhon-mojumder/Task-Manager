import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/task_manager/models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? userData;

  static Future saveUserData(String token, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('token', token);
    sharedPreferences.setString('user_data', jsonEncode(model.toJson()));

    AuthController.token = token;
    AuthController.userData = model;
  }

  static Future getUserData(String token, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');
    if (token != null) {
      AuthController.token = token;
    }
    String? user = sharedPreferences.getString('user_data');
    if (user != null) {
     AuthController.userData = UserModel.fromJson(jsonDecode(user));
    }
  }
}
