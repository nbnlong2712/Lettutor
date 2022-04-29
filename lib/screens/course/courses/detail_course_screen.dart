import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/course.dart';
import 'package:flutter_lettutor/screens/course/courses/course_component_label.dart';
import 'package:flutter_lettutor/screens/course/courses/course_header.dart';
import 'package:flutter_lettutor/screens/course/courses/topic_card.dart';
import 'package:recase/recase.dart';

class DetailCourseScreen extends StatefulWidget {
  DetailCourseScreen({Key? key, required this.course}) : super(key: key);

  Course course;

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  int totalTutors = 1;

  final TextStyle _style = const TextStyle(color: Colors.black54);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CourseHeader(background: widget.course.imageUrl!, totalTutors: totalTutors, totalLessons: widget.course.topicsLength!),
                    Container(
                      width: _width,
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[CourseComponentLabel(label: "About Course"), Text(widget.course.description!, style: _style)],
                      ),
                    ),
                    Container(
                      width: _width,
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CourseComponentLabel(label: "Overview"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: const <Widget>[
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8.0), child: Icon(Icons.help_outline, color: Colors.red)),
                                Text("Why take this course?")
                              ],
                            ),
                          ),
                          Text(widget.course.reason!, style: _style),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: const <Widget>[
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8.0), child: Icon(Icons.help_outline, color: Colors.red)),
                                Text("Why take this course?")
                              ],
                            ),
                          ),
                          Text(widget.course.purpose!, style: _style),
                        ],
                      ),
                    ),
                    Container(
                      width: _width,
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[CourseComponentLabel(label: "Level"), Text(ReCase(widget.course.level!).titleCase)],
                      ),
                    ),
                    Container(
                      width: _width,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CourseComponentLabel(label: "Topic"),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: widget.course.topics!.map((e) => TopicCard(topic: e,)).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
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
