class Booking{
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  int? scoreByTutor;
  String? recordUrl;
  DateTime? startPeriodTimestamp;
  DateTime? endPeriodTimestamp;
  String? tutorId;
  String? tutorAvatar;
  String? tutorName;

  Booking(this.id, this.userId, this.scheduleDetailId, this.tutorMeetingLink, this.studentMeetingLink, this.scoreByTutor, this.recordUrl,
      this.startPeriodTimestamp, this.endPeriodTimestamp, this.tutorId, this.tutorAvatar, this.tutorName);

  Booking.fromJsonForHistory(Map map){
    id = map['id'];
    userId = map['userId'];
    scheduleDetailId = map['scheduleDetailId'];
    scoreByTutor = map['scoreByTutor'];
    recordUrl = map['recordUrl'];
    startPeriodTimestamp = DateTime.fromMicrosecondsSinceEpoch(map['scheduleDetailInfo']['startPeriodTimestamp'] * 1000);
    endPeriodTimestamp = DateTime.fromMicrosecondsSinceEpoch(map['scheduleDetailInfo']['endPeriodTimestamp'] * 1000);
    tutorId = map['scheduleDetailInfo']['scheduleInfo']['tutorId'];
    tutorAvatar = map['scheduleDetailInfo']['scheduleInfo']['tutorInfo']['avatar'];
    tutorName = map['scheduleDetailInfo']['scheduleInfo']['tutorInfo']['name'];
  }

  Booking.fromJsonForUpcoming(Map map){
    id = map['id'];
    userId = map['userId'];
    scheduleDetailId = map['scheduleDetailId'];
    tutorMeetingLink = map['tutorMeetingLink'];
    studentMeetingLink = map['studentMeetingLink'];
    startPeriodTimestamp = DateTime.fromMicrosecondsSinceEpoch(map['scheduleDetailInfo']['startPeriodTimestamp'] * 1000);
    endPeriodTimestamp = DateTime.fromMicrosecondsSinceEpoch(map['scheduleDetailInfo']['endPeriodTimestamp'] * 1000);
    tutorId = map['scheduleDetailInfo']['scheduleInfo']['tutorId'];
    tutorAvatar = map['scheduleDetailInfo']['scheduleInfo']['tutorInfo']['avatar'];
    tutorName = map['scheduleDetailInfo']['scheduleInfo']['tutorInfo']['name'];
  }

  @override
  String toString() {
    return 'Booking{id: $id, userId: $userId, scheduleDetailId: $scheduleDetailId, tutorMeetingLink: $tutorMeetingLink, studentMeetingLink: $studentMeetingLink, scoreByTutor: $scoreByTutor, recordUrl: $recordUrl, startPeriodTimestamp: $startPeriodTimestamp, endPeriodTimestamp: $endPeriodTimestamp, tutorId: $tutorId, tutorAvatar: $tutorAvatar, tutorName: $tutorName}';
  }
}