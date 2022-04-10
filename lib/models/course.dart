import 'package:objectbox/objectbox.dart';

class Course {
  late String id;
  late String name;
  late String description;
  late String imageUrl;
  late String level;
  late String reason;
  late String purpose;

  Course(this.id, this.name, this.description, this.imageUrl, this.level, this.reason, this.purpose);

  Course.fromJson(Map map)
      : id = map['id'],
        name = map['name'],
        description = map['description'],
        imageUrl = map['imageUrl'],
        level = map['level'],
        reason = map['reason'],
        purpose = map['purpose'];

  Map toJson() {
    return {'id': id, 'name': name, 'description': description, 'imageUrl': imageUrl, 'level': level, 'reason': reason, 'purpose': purpose};
  }

  @override
  String toString() {
    return 'Course{id: $id, name: $name, description: $description, imageUrl: $imageUrl, level: $level, reason: $reason, purpose: $purpose}';
  }
}
