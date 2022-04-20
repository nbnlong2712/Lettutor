import 'package:flutter_lettutor/models/topic.dart';
import 'package:flutter_lettutor/utils/constant.dart';

class Course {
  late String id;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? category;
  int? topicsLength;
  List<Topic>? topics;

  Course(this.id, this.name, this.description, this.imageUrl, this.level, this.reason, this.purpose /*, this.category*/);

  Course.fromJson(Map map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    imageUrl = map['imageUrl'];
    level = Constant.Levels[map['level']];
    reason = map['reason'];
    purpose = map['purpose'];
    if (map['topics'] != null) {
      topicsLength = map['topics'].length;
    } else {
      topicsLength = 0;
    }
    category = map['categories'][0]['title'];
  }

  Course.fromJsonHaveTopics(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    level = Constant.Levels[json['level']];
    reason = json['reason'];
    purpose = json['purpose'];
    category = json['categories'][0]['title'];
    if (json['topics'] != null) {
      topicsLength = json['topics'].length;
    } else {
      topicsLength = 0;
    }
    if (json['topics'] != null) {
      topics = <Topic>[];
      json['topics'].forEach((v) {
        topics!.add(Topic.fromJson(v));
      });
    }
  }

  Map toJson() {
    return {'id': id, 'name': name, 'description': description, 'imageUrl': imageUrl, 'level': level, 'reason': reason, 'purpose': purpose};
  }

  @override
  String toString() {
    return 'Course{id: $id, name: $name, description: $description, imageUrl: $imageUrl, level: $level, reason: $reason, purpose: $purpose, category: $category}';
  }
}
