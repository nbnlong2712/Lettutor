import 'package:flutter/material.dart';
import 'package:flutter_lettutor/comment/comment_card.dart';
import 'package:flutter_lettutor/widget/report_chip.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_lettutor/screens/tutors/tutor_video.dart';
import 'package:flutter_lettutor/widget/skill_chip.dart';
import 'package:video_player/video_player.dart';

class TutorDetailScreen extends StatefulWidget {
  TutorDetailScreen({Key? key, required this.isFavourite, required this.describe, required this.avatar})
      : super(key: key);

  bool isFavourite;
  String describe;
  String avatar;

  @override
  State<TutorDetailScreen> createState() => _TutorDetailScreenState();
}

class _TutorDetailScreenState extends State<TutorDetailScreen> {
  final TextEditingController _controller = TextEditingController();

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
                              backgroundImage: AssetImage(widget.avatar),
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
                                widget.isFavourite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                                size: 30,
                              ),
                              onTap: () {
                                setState(() {
                                  if (widget.isFavourite) {
                                    widget.isFavourite = false;
                                  } else {
                                    widget.isFavourite = true;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  LongFloatingButton(onPressed: () {}, child: const Text("Book"), color: Colors.green,),
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
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.message, color: Colors.green),
                                ),
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
                                            child: Text("Report this tutor!")),
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
                                              focusedBorder:
                                                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.describe),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Languages",
                          style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              SkillChip(skillName: "Vietnamese"),
                              SkillChip(skillName: "English"),
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
                      children: const <Widget>[
                        Text(
                          "Interest",
                          style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "First, you need a data source. For example, your data source might be a list of messages, search result,...",
                          style: TextStyle(color: Colors.black54),
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
                          style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              SkillChip(skillName: "TOEFL"),
                              SkillChip(skillName: "IELTS"),
                              SkillChip(skillName: "Business English"),
                              SkillChip(skillName: "TOEIC"),
                              SkillChip(skillName: "Millionaire"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Hay",
                          time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Hay qua",
                          time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Qua hay ban oi",
                          time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Good",
                          time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Tot",
                          time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Comment",
                          time: "Wed, 1/5/2022 12:00 AM"),
                      CommentCard(
                          avatar: "assets/images/avatar_long.png",
                          name: "Nhat Long",
                          comment: "Good job",
                          time: "Wed, 1/5/2022 12:00 AM"),
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
