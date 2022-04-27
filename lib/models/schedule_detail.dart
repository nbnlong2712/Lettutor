class ScheduleDetail {
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  bool? isBooked;

  ScheduleDetail(this.startPeriodTimestamp, this.endPeriodTimestamp, this.id, this.scheduleId, this.startPeriod, this.endPeriod, this.isBooked);

  ScheduleDetail.fromJson(Map<String, dynamic> json) {
    startPeriodTimestamp = json['startPeriodTimestamp'];
    endPeriodTimestamp = json['endPeriodTimestamp'];
    id = json['id'];
    scheduleId = json['scheduleId'];
    startPeriod = json['startPeriod'];
    endPeriod = json['endPeriod'];
    isBooked = json['isBooked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startPeriodTimestamp'] = startPeriodTimestamp;
    data['endPeriodTimestamp'] = endPeriodTimestamp;
    data['id'] = id;
    data['scheduleId'] = scheduleId;
    data['startPeriod'] = startPeriod;
    data['endPeriod'] = endPeriod;
    data['isBooked'] = isBooked;
    return data;
  }

  @override
  String toString() {
    return 'ScheduleDetail{startPeriodTimestamp: $startPeriodTimestamp, endPeriodTimestamp: $endPeriodTimestamp, id: $id, scheduleId: $scheduleId, startPeriod: $startPeriod, endPeriod: $endPeriod, isBooked: $isBooked}';
  }
}
