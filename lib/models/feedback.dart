
import 'package:intl/intl.dart';

class Feedback {
  String? id;
  String? studentId; //firstId
  String? studentAvatar;
  String? studentName;
  String? tutorId; //secondId
  int? rating;
  String? content;
  DateTime? createdAt;


  Feedback(this.id, this.studentId, this.studentAvatar, this.studentName, this.tutorId, this.rating, this.content, this.createdAt);

  Feedback.fromJson(Map map){
    id = map['id'];
    studentId = map['firstId'];
    studentAvatar = map['firstInfo']['avatar'];
    studentName = map['firstInfo']['name'];
    tutorId = map['secondId'];
    rating = map['rating'];
    content = map['content'];
    createdAt = DateFormat("yyyy-MM-dd hh:mm:ss").parse(DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(map['createdAt']).toString());
  }

  @override
  String toString() {
    return 'Feedback{id: $id, studentId: $studentId, studentAvatar: $studentAvatar, studentName: $studentName, tutorId: $tutorId, rating: $rating, content: $content, createdAt: $createdAt}';
  }
}