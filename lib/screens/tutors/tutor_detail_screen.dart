import 'package:flutter/material.dart';
import 'package:flutter_lettutor/comment/comment_card.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_video.dart';
import 'package:flutter_lettutor/widget/skill_tag.dart';
import 'package:video_player/video_player.dart';

class TutorDetailScreen extends StatefulWidget {
  TutorDetailScreen({
    Key? key,
    required this.isFavourite,
    required this.describe,
    required this.avatar
  }) : super(key: key);

  bool isFavourite;
  String describe;
  String avatar;

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Flex(
            //height: MediaQuery.of(context).size.height,
            direction: Axis.vertical,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TutorVideo(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage:
                              AssetImage(widget.avatar),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nhat Long",
                                    style: TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "Student, human, man",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    "Vietnam",
                                    style: TextStyle(fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return const Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  );
                                },
                              ),
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
                        )
                      ],
                    ),
                  ),
                  LongFloatingButton(onPressed: () {}, label: Text("Book")),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.describe),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Languages",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              SkillTag(skillName: "Vietnamese"),
                              SkillTag(skillName: "English"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Interest",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "First, you need a data source. For example, your data source might be a list of messages, search result,...",
                          style: TextStyle(color: Colors.black45),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Specialties",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              SkillTag(skillName: "TOEFL"),
                              SkillTag(skillName: "IELTS"),
                              SkillTag(skillName: "Business English"),
                              SkillTag(skillName: "TOEIC"),
                              SkillTag(skillName: "Millionaire"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Hay", time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Hay qua", time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Qua hay ban oi", time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Good", time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Tot", time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Comment", time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(avatar: "assets/images/avatar_long.png", name: "Nhat Long", comment: "Good job", time: "Wed, 1/5/2022 12:00 AM"),
                    ],
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
