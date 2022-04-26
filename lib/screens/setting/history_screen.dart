import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/booking_request.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:flutter_lettutor/screens/setting/history_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HistoryScreen extends StatefulWidget {
  static const String router = "/history-screen";

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Booking> historyList = [];
  bool isShowIndicator = true;

  @override
  void initState() {
    super.initState();
    fetchHistoryBooking();
  }

  void fetchHistoryBooking() async {
    await BookingRequest.fetchAllBookingsHistory().then((value) {
      for (var element in value) {
        if (element.endPeriodTimestamp!.isBefore(DateTime.now())) {
          historyList.add(element);
        }
      }
      setState(() {
        isShowIndicator = false;
      });
    }).catchError((e) {
      setState(() {
        isShowIndicator = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: const Text(
          "History",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: historyList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return HistoryCard(booking: historyList[index]);
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
