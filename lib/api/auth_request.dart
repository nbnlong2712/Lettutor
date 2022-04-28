import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/message.dart';
import 'package:flutter_lettutor/models/token.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRequest {
  static const String _url = "https://sandbox.api.lettutor.com";

  static const Map<String, String> _header = {
    "Content-Type": "application/json",
  };

  static Future<Map<String, String>> _headers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  // Register
  static Future<Message> register(String email, String password) async {
    final body = {'email': email, 'password': password, 'source': null};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$_url/auth/register'), headers: _header, body: jsonBody);
    if (response.statusCode ~/ 100 == 2) {
      return Message(response.statusCode, "Register success!");
    } else {
      return _parseMessage(response.body, response.statusCode);
    }
  }

  // Fetch auth token
  static Token _parseToken(String responseBody) {
    var jsonMap = json.decode(responseBody);
    Token token = Token.fromJson(jsonMap);
    return token;
  }

  static Future<Token> fetchToken(String email, String password) async {
    final body = {'email': email, 'password': password};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$_url/auth/login'), headers: _header, body: jsonBody);
    if (response.statusCode == 200) {
      return _parseToken(response.body);
    } else {
      _navigateToLogin(response.body);
      throw Exception('Error ${response.statusCode}');
    }
  }

  //Change password
  static Message _parseMessage(String responseBody, int code) {
    var jsonMap = json.decode(responseBody);
    Message message = Message.fromJson(jsonMap, code);
    return message;
  }

  static Future<Message> changePassword(String oldPassword, String newPassword) async {
    final body = {'password': oldPassword, 'newPassword': newPassword};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$_url/auth/change-password'), headers: await _headers(), body: jsonBody);
    _navigateToLogin(response.body);
    return _parseMessage(response.body, response.statusCode);
  }

  //Forget password
  static Future<Message> forgotPassword(String email) async {
    final body = {'email': email};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$_url/user/forgotPassword'), headers: _header, body: jsonBody);
    _navigateToLogin(response.body);
    return _parseMessage(response.body, response.statusCode);
  }

  //Login with Facebook
  static Future<Token> loginFacebook(String accessToken) async {
    final body = {'access_token': accessToken};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$_url/auth/facebook'), headers: _header, body: jsonBody);
    if (response.statusCode == 200) {
      return _parseToken(response.body);
    } else {
      _navigateToLogin(response.body);
      throw Exception('Error ${response.statusCode}');
    }
  }

  //Login with Google
  static Future<Token> loginGoogle(String accessToken) async {
    final body = {'access_token': accessToken};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$_url/auth/google'), headers: _header, body: jsonBody);
    if (response.statusCode == 200) {
      return _parseToken(response.body);
    } else {
      _navigateToLogin(response.body);
      throw Exception('Error ${response.statusCode}');
    }
  }

  static void _navigateToLogin(statusCode) {
    if (statusCode == 401) {
      navigatorKey.currentState!.pushNamed(LoginScreen.router);
    }
  }
}
