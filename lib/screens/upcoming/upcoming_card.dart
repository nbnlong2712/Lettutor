import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UpcomingCard extends StatelessWidget {
  UpcomingCard({
    Key? key,
    required this.avatar,
    required this.name,
    required this.bookingDate,
    required this.endTime,
    required this.startTime,
  }) : super(key: key);

  String avatar;
  String name;
  String bookingDate;
  String startTime;
  String endTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Neumorphic(
        style: const NeumorphicStyle(
            depth: 4,
            intensity: 0.8,
            color: Color.fromRGBO(220, 228, 228, 130),
            shadowDarkColor: Colors.black87,
            lightSource: LightSource.topLeft,
            shadowLightColorEmboss: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(backgroundImage: AssetImage(avatar), radius: 35),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                      Row(
                        children: <Widget>[
                          Text(bookingDate),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              backgroundColor: const Color.fromRGBO(0, 187, 0, 220),
                              label: Text(startTime, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1, color: Colors.green)),
                            ),
                          ),
                          const Text(" - "),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              backgroundColor: Colors.orange.shade100,
                              label: Text(endTime, style: TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), side: BorderSide(width: 1, color: Colors.deepOrangeAccent)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NeumorphicButton(
                    style: NeumorphicStyle(
                      depth: 3,
                      shape: NeumorphicShape.flat,
                      intensity: 0.9,
                      color: Colors.red.shade100,
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  NeumorphicButton(
                    style: NeumorphicStyle(
                      depth: 3,
                      shape: NeumorphicShape.flat,
                      intensity: 0.9,
                      color: Colors.green.shade100,
                    ),
                    onPressed: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: Center(
                        child: Text(
                          "Go to meeting",
                          style: TextStyle(color: Colors.green),
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
