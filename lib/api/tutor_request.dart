import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class TutorRequest {
  static const String url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  //Tutor
  static List<Tutor> parseTutor(String responseBody) {
    var list = json.decode(responseBody);
    List<Tutor> tutors = List.empty(growable: true);
    if (list['tutors']['rows'] != null) {
      list['tutors']['rows'].forEach((v) {
        tutors.add(Tutor.fromJson(v));
      });
    }
    return tutors;
  }

  static Future<List<Tutor>> fetchAllTutor() async {
    final response = await http.get(Uri.parse('$url/tutor/more'), headers: await header());
    if (response.statusCode == 200) {
      return parseTutor(response.body);
    } else {
      navigateToLogin(response.statusCode);
      throw Exception('Cant get tutor');
    }
  }

  static void navigateToLogin(statusCode)
  {
    if(statusCode == 401)
    {
      navigatorKey.currentState!.pushNamed(LoginScreen.router);
    }
  }
}
