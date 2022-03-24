class Schedule {
  int id = 0;
  late int  tutorId ;
  late int ? studentId;
  late DateTime startTime;
  late DateTime endTime;
  late bool isBooked;

  Schedule(this.tutorId, this.studentId, this.startTime, this.endTime, this.isBooked);
}