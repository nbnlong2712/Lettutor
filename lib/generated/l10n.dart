// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'The current Language',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Xin chao`
  String get helloWorld {
    return Intl.message(
      'Xin chao',
      name: 'helloWorld',
      desc: 'A programmer greeting',
      args: [],
    );
  }

  /// `Hello {username}`
  String hello(String username) {
    return Intl.message(
      'Hello $username',
      name: 'hello',
      desc: 'A welcome message',
      args: [username],
    );
  }

  /// `-----------------------`
  String get loginScreen {
    return Intl.message(
      '-----------------------',
      name: 'loginScreen',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Not a member yet?`
  String get notAMemberYet {
    return Intl.message(
      'Not a member yet?',
      name: 'notAMemberYet',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get orContinueWith {
    return Intl.message(
      'Or continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------`
  String get homeScreen {
    return Intl.message(
      '-------------------------',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Recommend Tutors`
  String get recommendTutors {
    return Intl.message(
      'Recommend Tutors',
      name: 'recommendTutors',
      desc: '',
      args: [],
    );
  }

  /// `Enter a room`
  String get enterLessonRoom {
    return Intl.message(
      'Enter a room',
      name: 'enterLessonRoom',
      desc: '',
      args: [],
    );
  }

  /// `Upcomming Lesson`
  String get upcommingLesson {
    return Intl.message(
      'Upcomming Lesson',
      name: 'upcommingLesson',
      desc: '',
      args: [],
    );
  }

  /// `------------------------`
  String get courseScreen {
    return Intl.message(
      '------------------------',
      name: 'courseScreen',
      desc: '',
      args: [],
    );
  }

  /// `Courses`
  String get courses {
    return Intl.message(
      'Courses',
      name: 'courses',
      desc: '',
      args: [],
    );
  }

  /// `Course`
  String get course {
    return Intl.message(
      'Course',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `Search courses...`
  String get searchCourses {
    return Intl.message(
      'Search courses...',
      name: 'searchCourses',
      desc: '',
      args: [],
    );
  }

  /// `------------------------`
  String get upcomingScreen {
    return Intl.message(
      '------------------------',
      name: 'upcomingScreen',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `-------------------------`
  String get tutorsScreen {
    return Intl.message(
      '-------------------------',
      name: 'tutorsScreen',
      desc: '',
      args: [],
    );
  }

  /// `Tutors`
  String get tutors {
    return Intl.message(
      'Tutors',
      name: 'tutors',
      desc: '',
      args: [],
    );
  }

  /// `Search tutors...`
  String get searchTutors {
    return Intl.message(
      'Search tutors...',
      name: 'searchTutors',
      desc: '',
      args: [],
    );
  }

  /// `------------------------`
  String get settingScreen {
    return Intl.message(
      '------------------------',
      name: 'settingScreen',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Session History`
  String get sessionHistory {
    return Intl.message(
      'Session History',
      name: 'sessionHistory',
      desc: '',
      args: [],
    );
  }

  /// `Advanced setting`
  String get advancedSetting {
    return Intl.message(
      'Advanced setting',
      name: 'advancedSetting',
      desc: '',
      args: [],
    );
  }

  /// `Become a teacher`
  String get becomeATeacher {
    return Intl.message(
      'Become a teacher',
      name: 'becomeATeacher',
      desc: '',
      args: [],
    );
  }

  /// `Our website`
  String get ourWebsite {
    return Intl.message(
      'Our website',
      name: 'ourWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
