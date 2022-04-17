import 'package:flutter_lettutor/models/subject.dart';
import 'package:intl/intl.dart';

class User {
  late String id;
  late String email;
  late String name;
  late String avatar;
  late String country;
  String? phone;
  late String language;
  late DateTime birthday;
  late bool isActivated;
  late String level;
  late List<Subject> learnTopics;
  late List<Subject> testPreparations;

  User(this.id, this.email, this.name, this.avatar, this.country, this.phone, this.language, this.birthday, this.isActivated, this.level,
      this.learnTopics, this.testPreparations);

  User.fromJson(Map map) {
    id = map['id'];
    email = map['email'];
    name = map['name'];
    avatar = map['avatar'];
    country = map['country'];
    phone = map['phone'];
    language = map['language'];
    birthday = DateFormat("yyyy-MM-dd").parse(map['birthday']);
    isActivated = map['isActivated'];
    level = map['level'];
    if (map['learnTopics'] != null) {
      learnTopics = List<Subject>.empty(growable: true);
      map['learnTopics'].forEach((v) {
        learnTopics.add(Subject.fromJson(v));
      });
    }
    if (map['testPreparations'] != null) {
      testPreparations = List<Subject>.empty(growable: true);
      map['testPreparations'].forEach((v) {
        testPreparations.add(Subject.fromJson(v));
      });
    }
  }

  Map toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'country': country,
      'phone': phone,
      'language': language,
      'birthday': "${birthday.year}-${birthday.month}-${birthday.day}",
      'isActivated': isActivated,
      'level': level,
      'learnTopics': learnTopics,
      'testPreparations': testPreparations
    };
  }

  Map toJsonForUpdate(){
    List<String> lt = [];
    List<String> tp = [];

    for (var element in learnTopics) {
      lt.add('${element.id}');
    }

    for (var element in testPreparations) {
      tp.add('${element.id}');
    }

    return {
      'name': name,
      'country': country,
      'phone': phone,
      'birthday': "${birthday.year}-${birthday.month}-${birthday.day}",
      'level': level,
      'learnTopics': lt,
      'testPreparations': tp
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, avatar: $avatar, country: $country, phone: $phone, language: $language, birthDay: $birthday, isActivated: $isActivated, level: $level, learnTopics: $learnTopics, testPreparations: $testPreparations}';
  }
}
