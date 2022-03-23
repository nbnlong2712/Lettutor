import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/profile/profile_dropdown.dart';

class AdvancedSettingScreen extends StatelessWidget {
  static const String router = "/advanced-setting-screen";

  const AdvancedSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileDropDown(listItem: ["Vietnamese", "Enghlish"], value: "English"),
    );
  }
}
