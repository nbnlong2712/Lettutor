import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const router = "/forget-password-screen";

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Forget Password Screen"),
        ),
      ),
    );
  }
}
