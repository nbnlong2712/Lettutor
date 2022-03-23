import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/course/courses/detail_course_screen.dart';

class EbookCard extends StatelessWidget {
  EbookCard({
    Key? key,
    required this.level,
    required this.describe,
    required this.ebookName,
    required this.background,
  }) : super(key: key);

  String background;
  String ebookName;
  String describe;
  String level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
                child: Image.asset(background),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(ebookName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(describe, style: TextStyle(fontSize: 13),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(level, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
              ),
            ],
          )),
    );
  }
}
