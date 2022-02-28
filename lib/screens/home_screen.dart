import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const router = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
