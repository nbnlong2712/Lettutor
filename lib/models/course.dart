import 'package:objectbox/objectbox.dart';

@Entity()
class Course {
  @Id() int id = 0;

  late String name;
  late String description;
  late String imageUrl;
  late String level;
  late String reason;
  late String purpose;

  Course(this.name, this.description, this.imageUrl, this.level, this.reason, this.purpose);

  @override
  String toString() {
    return 'Course{id: $id, name: $name, description: $description, imageUrl: $imageUrl, level: $level, reason: $reason, purpose: $purpose}';
  }
}
