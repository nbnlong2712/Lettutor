import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_detail_screen.dart';
import 'package:flutter_lettutor/widget/skill_chip.dart';

import '../../home_page.dart';

class RecommendTutorCard extends StatefulWidget {
  RecommendTutorCard({Key? key, required this.tutor}) : super(key: key);

  Tutor tutor;

  @override
  State<RecommendTutorCard> createState() => _RecommendTutorCardState();
}

class _RecommendTutorCardState extends State<RecommendTutorCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: FileImage(File(mainUser.avatar!)),
                      radius: 30,
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "widget.tutor.name",
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      children: [
                                        Text("widget.tutor.stars", style: const TextStyle(fontSize: 17, color: Colors.red)),
                                        const Icon(Icons.star, color: Colors.orangeAccent)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                child: Icon(true ? Icons.favorite : Icons.favorite_border, color: Colors.red, size: 30),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.69,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              SkillChip(skillName: "TOEFL"),
                              SkillChip(skillName: "IELTS"),
                              SkillChip(skillName: "Business English"),
                              SkillChip(skillName: "TOEIC"),
                              SkillChip(skillName: "Millionaire"),
                              SkillChip(skillName: "SAT"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1), child: Text(widget.tutor.bio!)),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TutorDetailScreen(tutor: widget.tutor),
          ),
        );
      },
    );
  }
}
