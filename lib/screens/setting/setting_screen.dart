import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/screens/setting/become_teacher_screen.dart';
import 'package:flutter_lettutor/screens/setting/change_password_screen.dart';
import 'package:flutter_lettutor/screens/setting/history_screen.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';

class SettingScreen extends StatelessWidget {
  static const router = "/setting-screen";

  const SettingScreen({Key? key}) : super(key: key);

  Widget _widget(prefixIcon, text, suffixIcon) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0), child: Icon(prefixIcon, color: Colors.black54)),
              Text(text, style: const TextStyle(color: Colors.black54))
            ],
          ),
          Icon(suffixIcon, color: Colors.black54),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: CircleAvatar(backgroundImage: FileImage(File(mainUser.avatar)), radius: 40),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(mainUser.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                      Padding(padding: const EdgeInsets.all(6.0), child: Text(mainUser.email, style: const TextStyle(color: Colors.black54))),
                    ],
                  ),
                ],
              ),
              LongFloatingButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ChangePasswordScreen.router);
                  },
                  child: _widget(Icons.vpn_key_outlined, "Change password", Icons.arrow_forward_ios),
                  color: Colors.white),
              LongFloatingButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HistoryScreen.router);
                  },
                  child: _widget(Icons.history, "Session history", Icons.arrow_forward_ios),
                  color: Colors.white),
              LongFloatingButton(onPressed: () {}, child: _widget(Icons.settings, "Advanced setting", Icons.arrow_forward_ios), color: Colors.white),
              LongFloatingButton(
                  onPressed: () {
                    Navigator.pushNamed(context, BecomeTeacherScreen.router);
                  },
                  child: _widget(Icons.school_outlined, "Become a teacher", Icons.arrow_forward_ios),
                  color: Colors.white),
              LongFloatingButton(onPressed: () {}, child: _widget(Icons.blur_circular, "Our website", Icons.arrow_forward_ios), color: Colors.white),
              LongFloatingButton(onPressed: () {}, child: _widget(Icons.facebook, "Facebook", Icons.arrow_forward_ios), color: Colors.white),
              LongFloatingButton(onPressed: () {}, child: Text("Logout", style: TextStyle(color: Colors.white)), color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
