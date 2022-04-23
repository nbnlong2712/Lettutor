import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/tutor_request.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/home/recommend_tutor_card.dart';
import 'package:flutter_lettutor/screens/home/upcoming_banner.dart';
import 'package:flutter_lettutor/screens/profile/profile_screen.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../home_page.dart';

class HomeScreen extends StatefulWidget {
  static const router = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Tutor> tutorList = [];

  bool isShowIndicator = true;

  @override
  void initState() {
    super.initState();
    getAllTutor();
  }

  void getAllTutor() async{
    await TutorRequest.fetchAllTutor().then((value) {
      tutorList = value;
      setState(() {
        isShowIndicator = false;
      });
    }).catchError((e){
      print(e);
      setState(() {
        isShowIndicator = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                        Text("Recommend tutors", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.55,
                    width: MediaQuery.of(context).size.width,
                    child: ModalProgressHUD(
                      inAsyncCall: isShowIndicator,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: tutorList.map((tutor) => TutorCard(tutor: tutor)).toList(),
                      ),
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
