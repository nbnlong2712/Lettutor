import 'dart:convert';

import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class CourseRequest{
  static const String url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  //Fetch All Courses from server
  static List<Course> parseListCourses(String responseBody) {
    var list = json.decode(responseBody);
    List<Course> courses = List.empty(growable: true);
    if (list['data']['rows'] != null) {
      list['data']['rows'].forEach((v) {
        courses.add(Course.fromJson(v));
      });
    }
    return courses;
  }

  static Future<List<Course>> fetchAllCourses() async {
    final response = await http.get(Uri.parse('$url/course'), headers: await header());
    if (response.statusCode == 200) {
      return parseListCourses(response.body);
    } else {
      navigateToLogin(response.statusCode);
      throw Exception('Cant get course');
    }
  }

  //Fetch single Course from server
  static Course parseCourse(String responseBody) {
    var courseJson = json.decode(responseBody);
    Course course = Course.fromJsonHaveTopics(courseJson['data']);
    return course;
  }

  static Future<Course> fetchCourse(String courseId) async {
    final response = await http.get(Uri.parse('$url/course/$courseId'), headers: await header());
    if (response.statusCode == 200) {
      return parseCourse(response.body);
    } else {
      navigateToLogin(response.statusCode);
      throw Exception('Can\'t get course');
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