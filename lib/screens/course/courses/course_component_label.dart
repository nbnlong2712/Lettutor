import 'package:flutter/material.dart';

class CourseComponentLabel extends StatelessWidget {
  CourseComponentLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        label,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      ),
    );
    ;
  }
}
