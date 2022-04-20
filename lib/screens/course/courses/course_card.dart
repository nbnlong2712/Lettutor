import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/course_request.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:flutter_lettutor/screens/course/courses/detail_course_screen.dart';
import 'package:recase/recase.dart';

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
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image.network(course.imageUrl!),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        course.name!,
                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(ReCase(course.level!).titleCase),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${course.topicsLength!} lessons"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () async {
        await CourseRequest.fetchCourse(course.id).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailCourseScreen(
                course: value,
              ),
            ),
          );
        });
      },
    );
  }
}
