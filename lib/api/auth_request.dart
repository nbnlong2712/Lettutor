import 'dart:convert';
import 'package:flutter_lettutor/models/token.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRequest {
  static const String url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${prefs.getString("access")}"
    };
    return head;
  }

  //Token
  static Token parseToken(String responseBody) {
    var jsonMap = json.decode(responseBody);
    Token token = Token.fromJson(jsonMap);
    return token;
  }

  static Future<Token> fetchToken(String email, String password) async {
    final body = {'email': email, 'password': password};
    final jsonBody = json.encode(body);
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse('$url/auth/login'), headers: headers, body: jsonBody);
    if (response.statusCode == 200) {
      return parseToken(response.body);
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }

  //User
  static User parseUser(String responseBody) {
    var jsonMap = json.decode(responseBody);
    User user = User.fromJson(jsonMap['user']);
    return user;
  }

  static Future<User> fetchUser() async {
    Map<String, String> map = await header();
    final response = await http.get(Uri.parse('$url/user/info'), headers: map);
    if (response.statusCode == 200) {
      return parseUser(response.body);
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}