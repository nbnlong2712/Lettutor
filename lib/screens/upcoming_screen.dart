import 'package:flutter/material.dart';

class UpcomingScreen extends StatelessWidget {
  static const router = "/upcoming-screen";

  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Upcoming Screen"),
        ),
      ),
    );
  }
}
