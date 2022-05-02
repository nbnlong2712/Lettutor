import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/l10n/l10n.dart';
import 'package:flutter_lettutor/provider/language/language_provider.dart';
import 'package:flutter_lettutor/provider/theme/theme_model.dart';
import 'package:flutter_lettutor/screens/course/course_page.dart';
import 'package:flutter_lettutor/screens/home/home_screen.dart';
import 'package:flutter_lettutor/screens/setting/advanced_setting_screen.dart';
import 'package:flutter_lettutor/screens/setting/become_teacher_screen.dart';
import 'package:flutter_lettutor/screens/setting/change_password_screen.dart';
import 'package:flutter_lettutor/screens/setting/history_screen.dart';
import 'package:flutter_lettutor/screens/setting/setting_screen.dart';
import 'package:flutter_lettutor/screens/tutors/tutors_screen.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'auth/forget_password_screen.dart';
import 'auth/register_screen.dart';

late final GlobalKey<NavigatorState> navigatorKey;

void main() {
  navigatorKey = GlobalKey<NavigatorState>();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => LanguageProvider())
      ],
      child: Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
          final languageProvider = Provider.of<LanguageProvider>(context);

          return MaterialApp(
            title: 'Flutter Demo',
            locale: languageProvider.locale,
            supportedLocales:  AppLocalizations.supportedLocales,
            localizationsDelegates:  AppLocalizations.localizationsDelegates,
            navigatorKey: navigatorKey,
            theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
            initialRoute: LoginScreen.router,
            routes: {
              //home page
              HomePage.router: (context) => HomePage(),
              //auth
              LoginScreen.router: (context) => LoginScreen(),
              RegisterScreen.router: (context) => RegisterScreen(),
              ForgetPasswordScreen.router: (context) => ForgetPasswordScreen(),
              ChangePasswordScreen.router: (context) => ChangePasswordScreen(),
              //main
              HomeScreen.router: (context) => HomeScreen(),
              CoursePage.router: (context) => CoursePage(),
              SettingScreen.router: (context) => SettingScreen(),
              TutorsScreen.router: (context) => TutorsScreen(),
              UpcomingScreen.router: (context) => UpcomingScreen(),
              //setting
              ChangePasswordScreen.router: (context) => ChangePasswordScreen(),
              HistoryScreen.router: (context) => HistoryScreen(),
              AdvancedSettingScreen.router: (context) => AdvancedSettingScreen(),
              BecomeTeacherScreen.router: (context) => BecomeTeacherScreen(),
            },
          );
        },
      ),
    );
  }
}
