import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:flutter_lettutor/screens/course/courses/detail_course_screen.dart';

class CourseCard extends StatelessWidget {
  CourseCard({Key? key, required this.course}) : super(key: key);

  Course course;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              ClipRRect(
                child: Image.asset(course.imageUrl),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          course.name,
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(course.level),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("9 lessons"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCourseScreen(
              course: course,
            ),
          ),
        );
      },
    );
  }
}
