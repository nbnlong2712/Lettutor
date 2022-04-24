import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class BookingRequest{
  static const String url = "https://sandbox.api.lettutor.com";

  static const Map<String, String> header = {
    "Content-Type": "application/json",
  };

  static Future<Map<String, String>> headers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  //Fetch Booked class from server by History
  static List<Booking> parseListBookingsHistory(String responseBody) {
    var list = json.decode(responseBody);
    List<Booking> bookings = List.empty(growable: true);
    if (list['data']['rows'] != null) {
      list['data']['rows'].forEach((v) {
        bookings.add(Booking.fromJsonForHistory(v));
      });
    }
    return bookings;
  }

  static Future<List<Booking>> fetchAllBookingsHistory() async {
    final response = await http.get(Uri.parse('$url/booking/list/student?orderBy=meeting&sortBy=desc&dateTimeLte=3642805436469&page=1&perPage=500'), headers: await headers());
    if (response.statusCode == 200) {
      return parseListBookingsHistory(response.body);
    } else {
      navigateToLogin(response.statusCode);
      throw Exception('Cant get booking');
    }
  }

  //Fetch Booked class from server by Upcoming
  static List<Booking> parseListBookingsUpcoming(String responseBody) {
    var list = json.decode(responseBody);
    List<Booking> bookings = List.empty(growable: true);
    if (list['data']['rows'] != null) {
      list['data']['rows'].forEach((v) {
        bookings.add(Booking.fromJsonForUpcoming(v));
      });
    }
    return bookings;
  }

  static Future<List<Booking>> fetchAllBookingsUpcoming() async {
    final response = await http.get(Uri.parse('$url/booking/list/student?orderBy=meeting&sortBy=desc&dateTimeLte=3642805436469&page=1&perPage=500'), headers: await headers());
    if (response.statusCode == 200) {
      return parseListBookingsUpcoming(response.body);
    } else {
      navigateToLogin(response.statusCode);
      throw Exception('Cant get booking');
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