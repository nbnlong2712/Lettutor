class Schedule {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  DateTime? startTimestamp;
  DateTime? endTimestamp;
  bool? isBooked;

  Schedule(this.id, this.tutorId, this.startTime, this.endTime, this.startTimestamp, this.endTimestamp, this.isBooked);

  Schedule.fromJson(Map map)
      : id = map['id'],
        tutorId = map['tutorId'],
        startTime = map['startTime'],
        endTime = map['endTime'],
        startTimestamp = DateTime.fromMillisecondsSinceEpoch(map['startTimestamp'] * 1000),
        endTimestamp = DateTime.fromMillisecondsSinceEpoch(map['endTimestamp'] * 1000),
        isBooked = map['isBooked'];

  Map toJson() {
    return {
      'id': id,
      'tutorId': tutorId,
      'startTime': startTime,
      'endTime': endTime,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'isBooked': isBooked
    };
  }

  @override
  String toString() {
    return 'Schedule{id: $id, tutorId: $tutorId, startTime: $startTime, endTime: $endTime, startTimestamp: $startTimestamp, endTimestamp: $endTimestamp, isBooked: $isBooked}';
  }
}
