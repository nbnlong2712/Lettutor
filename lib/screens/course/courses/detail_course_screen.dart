import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/course/courses/course_component_label.dart';
import 'package:flutter_lettutor/screens/course/courses/course_header.dart';
import 'package:flutter_lettutor/screens/course/courses/topic_card.dart';

class DetailCourseScreen extends StatefulWidget {
  DetailCourseScreen(
      {Key? key, required this.background, required this.courseName, required this.level, required this.totalLessons})
      : super(key: key);

  String background;
  String courseName;
  String level;
  int totalLessons;

  @override
  State<DetailCourseScreen> createState() => _DetailCourseScreenState();
}

class _DetailCourseScreenState extends State<DetailCourseScreen> {
  int totalTutors = 1;

  final TextStyle _style = const TextStyle(color: Colors.black54);

  final _topics = [
    "Marco Van Baasten",
    "Thierry Henry",
    "Lionel Messi",
    "Công Phượng",
    "Phillipe Coutinho",
    "Luka Modric",
    "Sergio Busquest",
    "Dani Alves",
    "Marcel Desailly",
    "Virgil Van Dijk",
    "Phillip Lahm",
    "Thibaut Courtois"
  ];

  late List<TopicCard> _topicList;

  @override
  void initState() {
    super.initState();
    _topicList = List.generate(_topics.length, (index) => TopicCard(orderNumber: index, topicName: _topics[index]));
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
                    CourseHeader(
                        background: "assets/images/course_background.jpg",
                        totalTutors: totalTutors,
                        totalLessons: widget.totalLessons),
                    Container(
                      width: _width,
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CourseComponentLabel(label: "About Course"),
                          Text("Let's discuss how technology is changing the way we liveaaaaaaaaaaa", style: _style)
                        ],
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
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.help_outline, color: Colors.red),
                                ),
                                Text("Why take this course?")
                              ],
                            ),
                          ),
                          Text(
                              "Our world is rapidly changing thanks to new technology, and the "
                              "vocabylary needed to discuss modern life is evolving almost daily."
                              " In this course, you will learn the most up-to-date terminology "
                              "from expertly crafted lessons as well from your native-speaking tutor.",
                              style: _style),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.help_outline, color: Colors.red),
                                ),
                                Text("Why take this course?")
                              ],
                            ),
                          ),
                          Text(
                              "Our world is rapidly changing thanks to new technology, and the "
                              "vocabylary needed to discuss modern life is evolving almost daily."
                              " In this course, you will learn the most up-to-date terminology "
                              "from expertly crafted lessons as well from your native-speaking tutor.",
                              style: _style),
                        ],
                      ),
                    ),
                    Container(
                      width: _width,
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[CourseComponentLabel(label: "Level"), const Text("Intermediate")],
                      ),
                    ),
                    Container(
                      width: _width,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CourseComponentLabel(label: "Topic"),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: _topicList,
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
