
import 'package:intl/intl.dart';

class Feedback {
  late String id;
  late String bookingId;
  late String firstId;
  late String secondId;
  late int rating;
  late String content;
  late DateTime createdAt;

  Feedback(this.id, this.bookingId, this.firstId, this.secondId, this.rating, this.content, this.createdAt);


  Feedback.fromJson(Map map)
  : id = map['id'],
  bookingId = map['bookingId'],
  firstId = map['firstId'],
  secondId = map['secondId'],
  rating = map['rating'],
  content = map['content'],
  createdAt = DateFormat("yyyy-MM-dd hh:mm:ss").parse(map['createdAt']);

  Map toJson(){
    return {
      'id': id,
      'bookingId': bookingId,
      'firstId': firstId,
      'secondId': secondId,
      'rating': rating,
      'content': content,
      'createdAt': createdAt
    };
  }


  @override
  String toString() {
    return 'Feedback{id: $id, bookingId: $bookingId, firstId: $firstId, secondId: $secondId, rating: $rating, content: $content, createAt: $createdAt}';
  }
}
