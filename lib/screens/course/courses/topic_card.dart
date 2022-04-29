import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/topic.dart';
import 'package:flutter_lettutor/screens/course/courses/pdf_screen.dart';

class TopicCard extends StatelessWidget {
  TopicCard({
    Key? key,
    required this.topic,
  }) : super(key: key);

  Topic topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PdfScreen(topic: topic)));
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Chip(
                  backgroundColor: Colors.green,
                  label: Text(
                    topic.orderCourse.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  topic.name!,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
