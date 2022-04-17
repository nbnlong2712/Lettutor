import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:flutter_lettutor/screens/course/course_page.dart';
import 'package:flutter_lettutor/screens/home/home_screen.dart';
import 'package:flutter_lettutor/screens/setting/setting_screen.dart';
import 'package:flutter_lettutor/screens/tutors/tutors_screen.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/user_request.dart';

late User mainUser;

class HomePage extends StatefulWidget {
  static const router = "/home-page";

  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _screensList = [
    HomeScreen(),
    CoursePage(),
    UpcomingScreen(),
    TutorsScreen(),
    SettingScreen(),
  ];
  static const _iconList = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: "Course"),
    BottomNavigationBarItem(icon: Icon(Icons.watch_later_outlined), label: "Upcoming"),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: "Tutors"),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
  ];
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    getUserFromAccessToken();
  }

  void getUserFromAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("access") != null) {
      if (prefs.getString("access")!.isNotEmpty) {
        await UserRequest.fetchUser().then((value) {
          mainUser = value;
        }).catchError((e) {
          print(e);
        });
      }
    }
  }

  void _selectItem(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _iconList,
          currentIndex: _currentIndex,
          onTap: _selectItem,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
        body: _screensList.elementAt(_currentIndex),
      ),
    );
  }
}