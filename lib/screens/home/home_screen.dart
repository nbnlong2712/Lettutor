import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/home/recommend_tutor_card.dart';
import 'package:flutter_lettutor/screens/home/upcoming_banner.dart';
import 'package:flutter_lettutor/screens/profile/profile_screen.dart';

import '../../home_page.dart';

class HomeScreen extends StatefulWidget {
  static const router = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tutor> tutorList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: NetworkImage(mainUser.avatar!),
                backgroundColor: Colors.black12,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Column(
                children: <Widget>[
                  UpcomingBanner(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text("Recommend course", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                      ],
                    ),
                  ),
                  // Todo: Add recommended tutors here
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: tutorList.map((tutor) => RecommendTutorCard(tutor: tutor)).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
