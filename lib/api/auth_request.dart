import 'dart:convert';
import 'package:flutter_lettutor/models/token.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRequest {
  static const String url = "https://sandbox.api.lettutor.com";

  static const Map<String, String> header = {
    "Content-Type": "application/json",
  };

  static Token parseToken(String responseBody) {
    var jsonMap = json.decode(responseBody);
    Token token = Token.fromJson(jsonMap);
    return token;
  }

  static Future<Token> fetchToken(String email, String password) async {
    final body = {'email': email, 'password': password};
    final jsonBody = json.encode(body);
    final response = await http.post(Uri.parse('$url/auth/login'), headers: header, body: jsonBody);
    if (response.statusCode == 200) {
      return parseToken(response.body);
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}