import 'package:objectbox/objectbox.dart';

@Entity()
class Feedback {
  @Id() int id = 0;

  late int authId;
  late int tutorId;
  late String content;
  late double stars;
  late DateTime createAt;

  Feedback(this.authId, this.tutorId, this.content, this.stars, this.createAt);

  @override
  String toString() {
    return 'Feedback{id: $id, authId: $authId, tutorId: $tutorId, content: $content, stars: $stars, createAt: $createAt}';
  }
}
