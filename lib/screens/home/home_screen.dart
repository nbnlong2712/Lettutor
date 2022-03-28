import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/screens/home/recommend_tutor_card.dart';
import 'package:flutter_lettutor/screens/home/upcoming_banner.dart';
import 'package:flutter_lettutor/screens/profile/profile_screen.dart';
import 'package:flutter_lettutor/screens/tutors/tutors_screen.dart';

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
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/avatar_long.png"),
                backgroundColor: Colors.black12,
              ),
              onTap: () {
                dao.getAllTutorFromDb().forEach((element) {
                  print(element.toString());
                });
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
                      children: <Widget>[
                        const Text(
                          "Recommend course",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                      ],
                    ),
                  ),
                  RecommendTutorCard(
                    describe: "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: false,
                  ),
                  RecommendTutorCard(
                    describe: "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: true,
                  ),
                  RecommendTutorCard(
                    describe: "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: false,
                  ),
                  RecommendTutorCard(
                    describe: "First, you need a data source. For example, your data source might be a list of messages,"
                        " search results, or products in a store. Most of the time, this data comes from the internet or a database.",
                    avatar: "assets/images/avatar_long.png",
                    tutorName: "Nhat long",
                    isFavourite: true,
                  ),
                  RecommendTutorCard(
                    describe: "First, you need a data source. For example, your data source might be a list of messages,"
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
