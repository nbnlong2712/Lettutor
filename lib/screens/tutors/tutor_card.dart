import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/tutor_request.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_detail_screen.dart';
import 'package:flutter_lettutor/widget/skill_chip.dart';

import '../../home_page.dart';

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
                      backgroundImage: NetworkImage(tutor.avatar),
                      radius: 27,
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
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      tutor.name,
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                            children: tutor.specialties!.map((e) => SkillChip(skillName: e)).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                  child: Text(tutor.bio!),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () async {
        await TutorRequest.fetchTutor(tutor.userId).then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TutorDetailScreen(
                tutor: value,
              ),
            ),
          );
        });
      },
    );
  }
}
