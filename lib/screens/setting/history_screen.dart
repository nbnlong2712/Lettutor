import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/setting/history_card.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HistoryScreen extends StatelessWidget {
  static const String router = "/history-screen";

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _upcomingList = List.generate(
        10,
        (index) => HistoryCard(
            avatar: "assets/images/avatar_long.png",
            name: "Nhat Long",
            bookingDate: "Tue, 3/8/2022",
            endTime: "23:00",
            startTime: "23:30"));

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
