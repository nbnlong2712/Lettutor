import 'package:flutter/material.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_detail_screen.dart';
import 'package:flutter_lettutor/widget/skill_chip.dart';

class TutorCard extends StatelessWidget {
  TutorCard({Key? key, required this.avatar, required this.describe, required this.tutorName}) : super(key: key);

  String describe;
  String avatar;
  String tutorName;

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
                      backgroundImage: AssetImage(avatar),
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
                                    tutorName,
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.05,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: 5,
                                        itemBuilder: (BuildContext context, int index) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          );
                                        },
                                      ),
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
                  child: Text(describe),
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
              isFavourite: false,
              describe: describe,
              avatar: avatar,
            ),
          ),
        );
      },
    );
    ;
  }
}
