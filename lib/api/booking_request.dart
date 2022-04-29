import 'dart:convert';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:flutter_lettutor/models/message.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class BookingRequest {
  static const String _url = "https://sandbox.api.lettutor.com";

  static const Map<String, String> _header = {
    "Content-Type": "application/json",
  };

  static Future<Map<String, String>> _headers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> head = {"Content-Type": "application/json", "Authorization": "Bearer ${prefs.getString("access")}"};
    return head;
  }

  //Book a class
  static Message _parseMessage(String responseBody, int code) {
    var jsonMap = json.decode(responseBody);
    Message message = Message.fromJson(jsonMap, code);
    return message;
  }

  static Future<Message> bookMeeting(String scheduleDetailId, String note) async {
    final body = {
      "scheduleDetailIds": [scheduleDetailId],
      "note": note
    };
    final bodyJson = json.encode(body);
    final response = await http.post(Uri.parse('$_url/booking'), headers: await _headers(), body: bodyJson);
    if (response.statusCode == 200) {
      return _parseMessage(response.body, response.statusCode);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Booking failed!');
    }
  }

  //Fetch all Schedule by tutorId
  static List<Schedule> _parseListSchedule(String responseBody) {
    var list = json.decode(responseBody);
    List<Schedule> schedules = List.empty(growable: true);
    if (list['data'] != null) {
      list['data'].forEach((v) {
        schedules.add(Schedule.fromJson(v));
      });
    }
    return schedules;
  }

  static Future<List<Schedule>> fetchSchedulesByTutorId(String tutorId) async {
    final body = {"tutorId": tutorId};
    final bodyJson = json.encode(body);
    final response = await http.post(Uri.parse('$_url/schedule'), headers: await _headers(), body: bodyJson);
    if (response.statusCode == 200) {
      return _parseListSchedule(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get schedule');
    }
  }

  //Fetch Booked class from server by History
  static List<Booking> _parseListBookingsHistory(String responseBody) {
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
    final response = await http.get(Uri.parse('$_url/booking/list/student?orderBy=meeting&sortBy=desc&dateTimeLte=3642805436469&page=1&perPage=500'),
        headers: await _headers());
    if (response.statusCode == 200) {
      return _parseListBookingsHistory(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get booking');
    }
  }

  //Fetch Booked class from server by Upcoming
  static List<Booking> _parseListBookingsUpcoming(String responseBody) {
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
    final response = await http.get(Uri.parse('$_url/booking/list/student?orderBy=meeting&sortBy=desc&dateTimeLte=3642805436469&page=1&perPage=500'),
        headers: await _headers());
    if (response.statusCode == 200) {
      return _parseListBookingsUpcoming(response.body);
    } else {
      _navigateToLogin(response.statusCode);
      throw Exception('Cant get booking');
    }
  }

  static Future<Message> cancelBooking(String scheduleDetailId) async {
    final body = {
      'scheduleDetailIds': [scheduleDetailId]
    };
    final bodyJson = json.encode(body);
    final response = await http.delete(Uri.parse('$_url/booking'), headers: await _headers(), body: bodyJson);
    if (response.statusCode == 200) {
      return Message(response.statusCode, "Cancel booking successful!");
    } else {
      return _parseMessage(response.body, response.statusCode);
    }
  }

  static void _navigateToLogin(statusCode) {
    if (statusCode == 401) {
      navigatorKey.currentState!.pushNamed(LoginScreen.router);
    }
  }
}
