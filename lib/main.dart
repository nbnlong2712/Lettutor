import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/screens/course_screen.dart';
import 'package:flutter_lettutor/screens/home_screen.dart';
import 'package:flutter_lettutor/screens/setting_screen.dart';
import 'package:flutter_lettutor/screens/tutors_screen.dart';
import 'package:flutter_lettutor/screens/upcoming_screen.dart';

import 'auth/forget_password_screen.dart';
import 'auth/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: LoginScreen.router,
      routes: {
        //auth
        LoginScreen.router: (context) => LoginScreen(),
        RegisterScreen.router: (context) => RegisterScreen(),
        ForgetPasswordScreen.router:(context) => ForgetPasswordScreen(),
        //main
        HomeScreen.router: (context) => HomeScreen(),
        CourseScreen.router: (context) => CourseScreen(),
        SettingScreen.router:(context) => SettingScreen(),
        TutorsScreen.router: (context) => TutorsScreen(),
        UpcomingScreen.router: (context) => UpcomingScreen(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _screensList = [
    HomeScreen(),
    CourseScreen(),
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
