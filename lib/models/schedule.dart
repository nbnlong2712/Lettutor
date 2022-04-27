import 'package:flutter_lettutor/models/schedule_detail.dart';

class Schedule {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  DateTime? startTimestamp;
  DateTime? endTimestamp;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;

  Schedule(this.id, this.tutorId, this.startTime, this.endTime, this.startTimestamp, this.endTimestamp, this.isBooked, this.scheduleDetails);

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tutorId = json['tutorId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    startTimestamp = DateTime.fromMicrosecondsSinceEpoch(json['startTimestamp'] * 1000);
    endTimestamp = DateTime.fromMicrosecondsSinceEpoch(json['endTimestamp'] * 1000);
    if (json['scheduleDetails'] != null) {
      scheduleDetails = <ScheduleDetail>[];
      json['scheduleDetails'].forEach((v) {
        scheduleDetails!.add(ScheduleDetail.fromJson(v));
      });
    }
  }

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
