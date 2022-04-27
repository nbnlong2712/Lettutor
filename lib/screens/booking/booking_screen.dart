import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/booking_request.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/booking/booking_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({Key? key, required this.tutor}) : super(key: key);

  Tutor tutor;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<Schedule> schedules = [];
  bool showIndicator = true;

  @override
  void initState() {
    super.initState();
    fetchSchedules();
  }

  void fetchSchedules() async {
    await BookingRequest.fetchSchedulesByTutorId(widget.tutor.userId).then((value) {
      for (var element in value) {
        if (element.endTimestamp!.isAfter(DateTime(2022,4,27,DateTime.now().hour, DateTime.now().minute,0))) {
          schedules.add(element);
        }
      }
      setState(() {
        showIndicator = false;
      });
    }).catchError((e) {
      print(e);
      setState(() {
        showIndicator = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      alignment: Alignment.center,
      child: ModalProgressHUD(
        inAsyncCall: showIndicator,
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
      ),
    );
  }
}
