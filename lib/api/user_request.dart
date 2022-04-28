import 'dart:convert';

import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRequest {
  static const String _url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> _header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  static User _parseUser(String responseBody) {
    var userJson = json.decode(responseBody);
    User user = User.fromJson(userJson['user']);
    return user;
  }

  //Get user
  static Future<User> fetchUser() async {
    Map<String, String> map = await _header();
    final response = await http.get(Uri.parse('$_url/user/info'), headers: map);
    if (response.statusCode == 200) {
      return _parseUser(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Error ${response.statusCode}');
    }
  }

  //Update User
  static Future<bool> updateUser(User user) async {
    Map<String, String> map = await _header();
    final jsonBody = json.encode(user.toJsonForUpdate());
    final response = await http.put(Uri.parse('$_url/user/info'), headers: map, body: jsonBody);
    if (response.statusCode == 200) {
      return true;
    } else {
      _navigateToLogin(response.statusCode);
      return false;
    }
  }

  static void _navigateToLogin(statusCode)
  {
    if(statusCode == 401)
      {
        navigatorKey.currentState!.pushNamed(LoginScreen.router);
      }
  }
}
