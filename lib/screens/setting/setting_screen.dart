import 'package:flutter/material.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(prefixIcon, color: Colors.black54),
              ),
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
        title: const Text(
          "Setting",
          style: TextStyle(color: Colors.black),
        ),
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
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar_long.png"),
                      radius: 40,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "Nhat Long",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "nhatlonghn1203@gmail.com",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
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
              LongFloatingButton(
                  onPressed: () {},
                  child: _widget(Icons.settings, "Advanced setting", Icons.arrow_forward_ios),
                  color: Colors.white),
              LongFloatingButton(
                  onPressed: () {},
                  child: _widget(Icons.blur_circular, "Our website", Icons.arrow_forward_ios),
                  color: Colors.white),
              LongFloatingButton(
                  onPressed: () {},
                  child: _widget(Icons.facebook, "Facebook", Icons.arrow_forward_ios),
                  color: Colors.white),
              LongFloatingButton(
                  onPressed: () {}, child: Text("Logout", style: TextStyle(color: Colors.white)), color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
