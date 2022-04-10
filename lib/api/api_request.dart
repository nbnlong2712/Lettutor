import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/models/token.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  static const String url = "https://sandbox.api.lettutor.com";

  static const Map<String, String> header = {
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader:
    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJpYXQiOjE2NDkzODA1OTksImV4cCI6MTY0OTQ2Njk5OSwidHlwZSI6ImFjY2VzcyJ9.QQ7m2xWIZK8-bhClL5SyExmn381AXLFbQzCAtqhDM_w"
  };

  //Token
  static Token parseToken(String responseBody) {
    var jsonMap = json.decode(responseBody);
    Token token = Token.fromJson(jsonMap);
    return token;
  }

  static Future<Token> fetchToken(String email, String password) async {
    final body = {'email': email, 'password': password};
    final jsonBody = json.encode(body);
    final headers = {
      'Content-Type': 'application/json'
    };
    final response = await http.post(Uri.parse('$url/auth/login'), headers:headers, body: jsonBody);
    if(response.statusCode == 200)
      {
        print("${response.statusCode} success!!!");
        return parseToken(response.body);
      }
    else if (response.statusCode == 404) {
      throw Exception('404 Not found');
    } else {
      throw Exception('${response.statusCode} Cant login');
    }
  }

  //Tutor
  static List<Tutor> parseTutor(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Tutor> tutors = list.map((tutor) => Tutor.fromJson(tutor)).toList();
    return tutors;
  }

  static Future<List<Tutor>> fetchAllTutor({int perPage = 12, int page = 1}) async {
    Map<String, int> params = {"perPage": perPage, "page": page};
    final response = await http.get(Uri.parse('$url/tutor/more?perPage=$perPage&page=$page'), headers: header);
    if (response.statusCode == 200) {
      return compute(parseTutor, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('404 Not found');
    } else {
      throw Exception('Cant get tutor');
    }
  }
}
