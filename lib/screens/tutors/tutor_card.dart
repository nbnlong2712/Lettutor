import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_detail_screen.dart';
import 'package:flutter_lettutor/widget/skill_chip.dart';

class TutorCard extends StatelessWidget {
  TutorCard({Key? key, required this.tutor}) : super(key: key);

  Tutor tutor;

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
                      backgroundImage: FileImage(File(mainUser.avatar)),
                      radius: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    mainUser.name,
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: Row(
                                      children: [
                                        Text("5", style: const TextStyle(fontSize: 17, color: Colors.red)),
                                        const Icon(Icons.star, color: Colors.orangeAccent)
                                      ],
                                    ),
                                  ),
                                ],
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                  child: Text(tutor.bio),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TutorDetailScreen(
              tutor: tutor,
            ),
          ),
        );
      },
    );
    ;
  }
}
