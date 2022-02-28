import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/home/tutor_card.dart';
import 'package:flutter_lettutor/screens/home/upcoming_banner.dart';

class HomeScreen extends StatelessWidget {
  static const router = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

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
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/avatar_long.png"),
              backgroundColor: Colors.black12,
            ),
          )
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
                      children: <Widget>[
                        const Text(
                          "Recommend course",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        GestureDetector(
                          child: const Text("See all  >",
                              style: TextStyle(color: Colors.green)),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  TutorCard(
                    describe:
                    "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: false,
                  ),
                  TutorCard(
                    describe:
                    "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: true,
                  ),
                  TutorCard(
                    describe:
                    "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: false,
                  ),
                  TutorCard(
                    describe:
                    "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: true,
                  ),
                  TutorCard(
                    describe:
                    "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: false,
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
