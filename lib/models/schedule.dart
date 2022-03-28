import 'package:objectbox/objectbox.dart';

@Entity()
class Schedule {
  @Id() int id = 0;

  late int  tutorId ;
  late int ? studentId;
  late DateTime startTime;
  late DateTime endTime;
  late bool isBooked;

  Schedule(this.tutorId, this.studentId, this.startTime, this.endTime, this.isBooked);

  @override
  String toString() {
    return 'Schedule{id: $id, tutorId: $tutorId, studentId: $studentId, startTime: $startTime, endTime: $endTime, isBooked: $isBooked}';
  }
}