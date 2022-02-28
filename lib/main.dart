import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/screens/course_screen.dart';
import 'package:flutter_lettutor/screens/home/home_screen.dart';
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
        //home page
        HomePage.router: (context) => HomePage(),
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