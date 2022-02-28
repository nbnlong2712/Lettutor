import 'package:flutter/material.dart';

class TutorsScreen extends StatelessWidget {
  static const router = "/tutor-screen";

  const TutorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Tutors Screen"),
        ),
      ),
    );
  }
}
