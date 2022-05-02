import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/screens/setting/advanced_setting_screen.dart';
import 'package:flutter_lettutor/screens/setting/become_teacher_screen.dart';
import 'package:flutter_lettutor/screens/setting/change_password_screen.dart';
import 'package:flutter_lettutor/screens/setting/history_screen.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../home_page.dart';

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
        title: Text(AppLocalizations.of(context)!.setting, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: CircleAvatar(backgroundImage: NetworkImage(mainUser.avatar!), radius: 40),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(mainUser.name!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
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
                        child: _widget(Icons.vpn_key_outlined, AppLocalizations.of(context)!.changePassword, Icons.arrow_forward_ios),
                        color: Colors.white),
                    LongFloatingButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HistoryScreen.router);
                        },
                        child: _widget(Icons.history, AppLocalizations.of(context)!.sessionHistory, Icons.arrow_forward_ios),
                        color: Colors.white),
                    LongFloatingButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AdvancedSettingScreen.router);
                        },
                        child: _widget(Icons.settings, AppLocalizations.of(context)!.advancedSetting, Icons.arrow_forward_ios),
                        color: Colors.white),
                    LongFloatingButton(
                        onPressed: () {
                          Navigator.pushNamed(context, BecomeTeacherScreen.router);
                        },
                        child: _widget(Icons.school_outlined, AppLocalizations.of(context)!.becomeATeacher, Icons.arrow_forward_ios),
                        color: Colors.white),
                    LongFloatingButton(onPressed: () {}, child: _widget(Icons.blur_circular, AppLocalizations.of(context)!.ourWebsite, Icons.arrow_forward_ios), color: Colors.white),
                    LongFloatingButton(onPressed: () {}, child: _widget(Icons.facebook, AppLocalizations.of(context)!.facebook, Icons.arrow_forward_ios), color: Colors.white),
                    LongFloatingButton(
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("access", "");
                          prefs.setString("refresh", "");
                          if (FacebookAuth.instance != null) {
                            await FacebookAuth.instance.logOut();
                          }
                          if (await GoogleSignIn().isSignedIn()) {
                            await GoogleSignIn().signOut();
                          }
                          Navigator.pushNamedAndRemoveUntil(context, LoginScreen.router, (route) => false);
                        },
                        child: Text(AppLocalizations.of(context)!.logout, style: TextStyle(color: Colors.white)),
                        color: Colors.green),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
