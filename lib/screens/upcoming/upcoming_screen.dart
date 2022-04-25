import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/booking_request.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UpcomingScreen extends StatefulWidget {
  static const router = "/upcoming-screen";

  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  List<Booking> _upcomingList = [];
  bool isShowIndicator = true;

  @override
  void initState() {
    super.initState();
    fetchUpcomingList();
  }

  void fetchUpcomingList() async {
    await BookingRequest.fetchAllBookingsUpcoming().then((value) {
      for (var element in value) {
        if (element.endPeriodTimestamp!.isAfter(DateTime.now())) {
          _upcomingList.add(element);
        }
      }
      setState(() {
        isShowIndicator = false;
      });
    }).catchError((e) {
      print(e);
      if (mounted) {
        setState(() {
          isShowIndicator = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(220, 228, 228, 130),
      appBar: AppBar(
        title: const Text(
          "Upcoming",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isShowIndicator,
        child: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: _upcomingList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return UpcomingCard(booking: _upcomingList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
