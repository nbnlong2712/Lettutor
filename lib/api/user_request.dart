import 'dart:convert';

import 'package:flutter_lettutor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserRequest {
  static const String url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  static User parseUser(String responseBody) {
    var jsonMap = json.decode(responseBody);
    User user = User.fromJson(jsonMap['user']);
    return user;
  }

  //Get user
  static Future<User> fetchUser() async {
    Map<String, String> map = await header();
    final response = await http.get(Uri.parse('$url/user/info'), headers: map);
    if (response.statusCode == 200) {
      return parseUser(response.body);
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }

  //Update User
  static Future<bool> updateUser(User user) async {
    Map<String, String> map = await header();
    final jsonBody = json.encode(user.toJsonForUpdate());
    print(jsonBody);
    final response = await http.put(Uri.parse('$url/user/info'), headers: map, body: jsonBody);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}
