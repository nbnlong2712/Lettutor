import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_card.dart';

class UpcomingScreen extends StatelessWidget {
  static const router = "/upcoming-screen";

  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _upcomingList = List.generate(
        10,
            (index) => UpcomingCard(
            avatar: "assets/images/avatar_long.png",
            name: "Nhat Long",
            bookingDate: "Tue, 3/8/2022",
            endTime: "23:00",
            startTime: "23:30"));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(220, 228, 228, 130),
      appBar: AppBar(
        title: const Text(
          "Tutors",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return _upcomingList[index];
                    },
                    itemCount: _upcomingList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
