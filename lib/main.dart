import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/screens/course/course_page.dart';
import 'package:flutter_lettutor/screens/home/home_screen.dart';
import 'package:flutter_lettutor/screens/setting/advanced_setting_screen.dart';
import 'package:flutter_lettutor/screens/setting/become_teacher_screen.dart';
import 'package:flutter_lettutor/screens/setting/change_password_screen.dart';
import 'package:flutter_lettutor/screens/setting/history_screen.dart';
import 'package:flutter_lettutor/screens/setting/setting_screen.dart';
import 'package:flutter_lettutor/screens/tutors/tutors_screen.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_screen.dart';

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
        ForgetPasswordScreen.router: (context) => ForgetPasswordScreen(),
        ChangePasswordScreen.router: (context) => ChangePasswordScreen(),
        //main
        HomeScreen.router: (context) => HomeScreen(),
        CoursePage.router: (context) => CoursePage(),
        SettingScreen.router: (context) => SettingScreen(),
        TutorsScreen.router: (context) => TutorsScreen(),
        UpcomingScreen.router: (context) => UpcomingScreen(),
        //setting
        ChangePasswordScreen.router: (context) => ChangePasswordScreen(),
        HistoryScreen.router: (context) => HistoryScreen(),
        AdvancedSettingScreen.router: (context) => AdvancedSettingScreen(),
        BecomeTeacherScreen.router: (context) => BecomeTeacherScreen(),
      },
    );
  }
}
