import 'dart:convert';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class TutorRequest {
  static const String _url = "https://sandbox.api.lettutor.com";

  static Future<Map<String, String>> _header() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  //Fetch all Tutor from server
  static List<Tutor> _parseListTutors(String responseBody) {
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
    final response = await http.get(Uri.parse('$_url/tutor/more'), headers: await _header());
    if (response.statusCode == 200) {
      return _parseListTutors(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get tutor list');
    }
  }

  //Fetch single Tutor from server
  static Tutor _parseTutor(String responseBody) {
    var tutorJson = json.decode(responseBody);
    Tutor tutor = Tutor.fromJsonForDetail(tutorJson);
    return tutor;
  }

  static Future<Tutor> fetchTutor(String tutorId) async {
    final response = await http.get(Uri.parse('$_url/tutor/$tutorId'), headers: await _header());
    if (response.statusCode == 200) {
      return _parseTutor(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get tutor');
    }
  }

  //Get tutor rating
  static double _parseTutorRating(String responseBody) {
    var tutorJson = json.decode(responseBody);
    double rating = Tutor.fromJsonForRating(tutorJson).avgRating!;
    return rating;
  }

  static Future<double> fetchTutorRating(String tutorId) async {
    final response = await http.get(Uri.parse('$_url/tutor/$tutorId'), headers: await _header());
    if (response.statusCode == 200) {
      return _parseTutorRating(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get tutor');
    }
  }

  //Get tutor favourite
  static bool _parseTutorFavourite(String responseBody) {
    var tutorJson = json.decode(responseBody);
    bool favourite = Tutor.fromJsonForFavourite(tutorJson).isFavorite!;
    return favourite;
  }

  static Future<bool> fetchTutorFavourite(String tutorId) async {
    final response = await http.get(Uri.parse('$_url/tutor/$tutorId'), headers: await _header());
    if (response.statusCode == 200) {
      return _parseTutorFavourite(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get favour');
    }
  }

  //Add tutor to favourite
  static Future<void> addFavouriteTeacher(String tutorId) async {
    final body = {"tutorId": tutorId};
    final bodyJson = json.encode(body);
    final response = await http.post(Uri.parse('$_url/user/manageFavoriteTutor'), headers: await _header(), body: bodyJson);
    if (response.statusCode != 200) {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant post favourite teacher');
    }
  }

  static void _navigateToLogin(statusCode) {
    if (statusCode == 401) {
      navigatorKey.currentState!.pushNamed(LoginScreen.router);
    }
  }
}
