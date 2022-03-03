import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/course/courses/course_header.dart';

class DetailCourseScreen extends StatelessWidget {
  DetailCourseScreen(
      {Key? key, required this.background, required this.courseName, required this.level, required this.totalLessons})
      : super(key: key);

  String background;
  String courseName;
  String level;
  int totalLessons;
  int totalTutors = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CourseHeader(background: "assets/images/course_background.jpg", totalTutors: totalTutors, totalLessons: totalLessons),
                    Column(),
                    Column(),
                    Column(),
                    Column(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
