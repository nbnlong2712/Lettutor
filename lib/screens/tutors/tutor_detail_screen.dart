import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/comment/comment_card.dart';
import 'package:flutter_lettutor/models/feedback.dart' as Fb;
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/booking/booking_screen.dart';
import 'package:flutter_lettutor/utils/constant.dart';
import 'package:flutter_lettutor/widget/report_chip.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_video.dart';
import 'package:flutter_lettutor/widget/skill_chip.dart';

class TutorDetailScreen extends StatefulWidget {
  TutorDetailScreen({Key? key, required this.tutor}) : super(key: key);

  Tutor tutor;

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  String countryName = "";

  List<Fb.Feedback> feedbacks = [];

  @override
  void initState() {
    super.initState();
    countryName = Country.parse(widget.tutor.country!).name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const TutorVideo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(backgroundImage: NetworkImage(widget.tutor.avatar), radius: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(widget.tutor.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                                  Text(widget.tutor.profession!, style: const TextStyle(color: Colors.grey)),
                                  Text(countryName, style: const TextStyle(fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("${double.parse((widget.tutor.avgRating!).toStringAsFixed(1))}",
                                      style: const TextStyle(fontSize: 17, color: Colors.red)),
                                  const Icon(Icons.star, color: Colors.orangeAccent)
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Icon(true ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 30),
                              onTap: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  LongFloatingButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => SingleChildScrollView(
                          child: BookingScreen(
                            tutor: widget.tutor,
                          ),
                        ),
                      );
                    },
                    child: const Text("Book"),
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
                            onPressed: () {},
                            child: Column(
                              children: const <Widget>[
                                Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.message, color: Colors.green)),
                                Text("Message", style: TextStyle(color: Colors.green)),
                              ],
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.transparent, elevation: 0),
                            onPressed: () => showDialog(
                                  context: context,
                                  builder: (BuildContext context1) => AlertDialog(
                                    actions: [
                                      Center(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Report this tutor!")),
                                      )
                                    ],
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                    title: const Text("Report Nhat Long"),
                                    content: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.5,
                                      child: Column(
                                        children: <Widget>[
                                          const Text("Help us understand what's happening?"),
                                          TextField(
                                            maxLines: 5,
                                            controller: _controller,
                                            decoration: InputDecoration(
                                              hintText: "Enter report...",
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                            ),
                                          ),
                                          ReportChip(
                                            label: "This tutor is too handsome",
                                            onTap: (label) {
                                              _controller.text = "This tutor is too handsome";
                                            },
                                          ),
                                          ReportChip(
                                            label: "This tutor is handsome too",
                                            onTap: (label) {
                                              _controller.text = "This tutor is handsome, too";
                                            },
                                          ),
                                          ReportChip(
                                            label: "This tutor is too tall",
                                            onTap: (label) {
                                              _controller.text = "This tutor is too tall";
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            child: Column(
                              children: const <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.report_gmailerrorred_outlined, color: Colors.green),
                                ),
                                Text("Report", style: TextStyle(color: Colors.green)),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4), child: Text(widget.tutor.bio!)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text("Languages", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: widget.tutor.languages!.map((e) => SkillChip(skillName: Constant.IsoLangs[e]['name'])).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text("Interest", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.tutor.interests!, style: TextStyle(color: Colors.black54)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text("Specialties", style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: widget.tutor.specialties!.map((e) => SkillChip(skillName: e)).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: feedbacks.map((e) => CommentCard(feedback: e)).toList(),
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
