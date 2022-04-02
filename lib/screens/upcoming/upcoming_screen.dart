import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/screens/upcoming/upcoming_card.dart';

class UpcomingScreen extends StatefulWidget {
  static const router = "/upcoming-screen";

  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {

  List<Schedule> _upcomingList = [];

  @override
  void initState() {
    super.initState();
    dao.openDB();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _upcomingList = dao.getUpcomingList(mainUser.id);
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
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: _upcomingList.map((e) => UpcomingCard(schedule: e)).toList(),
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
