import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/screens/setting/history_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HistoryScreen extends StatefulWidget {
  static const String router = "/history-screen";

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Schedule> historyList = [];

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
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: historyList.map((e) => HistoryCard(schedule: e)).toList(),
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
