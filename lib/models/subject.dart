import 'package:flutter/material.dart';
import 'package:flutter_lettutor/utils/constant.dart';

class Subject {
  late int id;
  late String key;
  late String name;

  Subject(this.id, this.key, this.name);

  Subject.fromJson(Map map)
      : id = map['id'],
        key = map['key'],
        name = map['name'];

  Map toJson() {
    return {'id': id, 'key': key, 'name': name};
  }

  static Subject getLearnTopicByName(String name)
  {
    Subject? subject;
    for (var element in Constant.LearnTopics) {
      if(name.compareTo(element.name) == 0) {
        subject = element;
        break;
      }
    }
    return subject!;
  }

  static Subject getTestPreparationByName(String name)
  {
    Subject? subject;
    for (var element in Constant.TestPreparations) {
      if(name.compareTo(element.name) == 0) {
        subject = element;
        break;
      }
    }
    return subject!;
  }

  @override
  String toString() {
    return 'Subject{id: $id, key: $key, name: $name}';
  }
}
