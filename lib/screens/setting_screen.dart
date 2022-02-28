import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const router = "/setting-screen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Setting Screen"),
        ),
      ),
    );
  }
}
