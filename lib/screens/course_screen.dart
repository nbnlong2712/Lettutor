import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  static const router = "/course-screen";

  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Course Screen"),
        ),
      ),
    );
  }
}
