import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class UpComingCard extends StatelessWidget {
  UpComingCard({Key? key, required this.upcomming}) : super(key: key);

  final Booking upcomming;

  @override
  Widget build(BuildContext context) {
    final base64Decoded = base64.decode(base64.normalize(upcomming.studentMeetingLink!.split("token=")[1].split(".")[1]));
    final urlObject = utf8.decode(base64Decoded);
    final jsonRes = json.decode(urlObject);
    final String roomId = jsonRes['room'];
    final String tokenMeeting = upcomming.studentMeetingLink!.split("token=")[1];


    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height* 0.4,
          width: MediaQuery.of(context).size.width * 0.9,
          margin: const EdgeInsets.only(bottom: 10),
          child: Card(
            elevation: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            if (isVisibleMeetingBtn(upcomming)) {
                              final options = JitsiMeetingOptions(room: roomId)
                                ..serverURL = "https://meet.lettutor.com"
                                ..audioOnly = true
                                ..audioMuted = true
                                ..token = tokenMeeting
                                ..videoMuted = true;

                              await JitsiMeet.joinMeeting(options);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: isVisibleMeetingBtn(upcomming) ? Colors.blue : Colors.grey[200] as Color),
                                color: isVisibleMeetingBtn(upcomming) ? Colors.blue : Colors.grey[200] as Color,
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Meeting",
                                  style: TextStyle(color: isVisibleMeetingBtn(upcomming) ? Colors.white : Colors.grey[500] as Color),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isVisibleMeetingBtn(Booking bookingInfo) {
  final now = DateTime.now();
  return (now.day == bookingInfo.startPeriodTimestamp!.day && now.month == bookingInfo.startPeriodTimestamp!.month && now.year == bookingInfo.startPeriodTimestamp!.year);
}