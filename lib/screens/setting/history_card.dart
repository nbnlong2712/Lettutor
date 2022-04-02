import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({Key? key, required this.schedule}) : super(key: key);

  Schedule schedule;
  int? mark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Neumorphic(
        style: const NeumorphicStyle(
            depth: 3,
            intensity: 0.9,
            color: Color.fromRGBO(228, 228, 228, 100),
            shadowDarkColor: Colors.black87,
            lightSource: LightSource.topLeft,
            shape: NeumorphicShape.concave,
            shadowLightColorEmboss: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundImage: FileImage(File(mainUser.avatar)),
                      radius: 35,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          mainUser.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        Row(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.calendar_today_outlined),
                            ),
                            Text("${schedule.startTime.year}/${schedule.startTime.month}/${schedule.startTime.day}"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.watch_later_outlined),
                            ),
                            Text("${schedule.startTime.hour}:${schedule.startTime.minute} - ${schedule.endTime.hour}:${schedule.endTime.minute}"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(Icons.sports_score),
                            ),
                            Text(mark == null ? "Tutor hasn't mark yet" : mark.toString()),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: NeumorphicButton(
                      style: NeumorphicStyle(
                        depth: 3,
                        shape: NeumorphicShape.flat,
                        intensity: 1,
                        color: Colors.blue.shade100,
                      ),
                      onPressed: () {},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: const Center(
                          child: Text(
                            "Give feedback",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: NeumorphicButton(
                      style: const NeumorphicStyle(
                        depth: 3,
                        shape: NeumorphicShape.flat,
                        intensity: 1,
                        color: Colors.white10,
                      ),
                      onPressed: () {},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.videocam_outlined,
                              color: Colors.red,
                              size: 18,
                            ),
                            Text(
                              " Watch record",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
