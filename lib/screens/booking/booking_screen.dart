import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/booking/booking_card.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key? key, required this.tutor}) : super(key: key);

  Tutor tutor;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  List<Schedule> schedules = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                children: schedules.map((e) => BookingCard(schedule: e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
