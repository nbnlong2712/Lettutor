import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lettutor/widget/skill_tag.dart';

class TutorCard extends StatefulWidget {
  TutorCard({
    Key? key,
    required this.describe,
    required this.avatar,
    required this.tutorName,
    required this.isFavourite,
  }) : super(key: key);

  String describe;
  String avatar;
  bool isFavourite;
  String tutorName;

  @override
  State<TutorCard> createState() => _TutorCardState();
}

class _TutorCardState extends State<TutorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.avatar),
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
                                  widget.tutorName,
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.05,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                            GestureDetector(
                              child: Icon(
                                widget.isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 30,
                              ),
                              onTap: () {
                                setState(() {
                                  if (widget.isFavourite)
                                    widget.isFavourite = false;
                                  else
                                    widget.isFavourite = true;
                                });
                              },
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
                            SkillTag(skillName: "TOEFL"),
                            SkillTag(skillName: "IELTS"),
                            SkillTag(skillName: "Business English"),
                            SkillTag(skillName: "TOEIC"),
                            SkillTag(skillName: "Millionaire"),
                            SkillTag(skillName: "SAT"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 1),
                child: Text(widget.describe),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
