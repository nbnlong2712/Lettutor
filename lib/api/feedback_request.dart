import 'dart:convert';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class FeedbackRequest {
  static const String url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  //Fetch all Feedback from server
  static List<Feedback> parseListFeedbacks(String responseBody) {
    var list = json.decode(responseBody);
    List<Feedback> feedbacks = List.empty(growable: true);
    if (list['User']['feedbacks'] != null) {
      list['User']['feedbacks'].forEach((v) {
        feedbacks.add(Feedback.fromJson(v));
      });
    }
    return feedbacks;
  }

  static Future<List<Feedback>> fetchAllFeedback(String tutorId) async {
    final response = await http.get(Uri.parse('$url/tutor/$tutorId'), headers: await header());
    if (response.statusCode == 200) {
      return parseListFeedbacks(response.body);
    } else {
      navigateToLogin(response.statusCode);
      throw Exception('Cant get tutor list');
    }
  }

  //Post feedback
  static Future<bool> postFeedback(String bookingId, String userId, int rating, String content) async {
    final body = {"bookingId": bookingId, "userId": userId, "rating": rating, "content": content};
    final bodyJson = json.encode(body);
    final response = await http.post(Uri.parse('$url/user/feedbackTutor'), headers: await header(), body: bodyJson);
    if(response.statusCode == 200)
      return true;
    else{
      navigateToLogin(response.statusCode);
      return false;
    }
  }

  static void navigateToLogin(statusCode) {
    if (statusCode == 401) {
      navigatorKey.currentState!.pushNamed(LoginScreen.router);
    }
  }
}
