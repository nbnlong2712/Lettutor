import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/screens/booking/booking_hour_card.dart';

class BookingHourScreen extends StatefulWidget {
  BookingHourScreen({Key? key, required this.schedule}) : super(key: key);

  Schedule schedule;

  @override
  _BookingHourScreenState createState() => _BookingHourScreenState();
}

class _BookingHourScreenState extends State<BookingHourScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: widget.schedule.scheduleDetails!
                    .map((e) => BookingHourCard(
                          scheduleDetailId: e.id!,
                          startTime: e.startPeriod!,
                          endTime: e.endPeriod!,
                          isBook: e.isBooked!,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
