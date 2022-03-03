import 'package:flutter/material.dart';

class CourseHeader extends StatelessWidget {
  CourseHeader({
    Key? key,
    required this.background,
    required this.totalTutors,
    required this.totalLessons,
  }) : super(key: key);

  String background;
  int totalLessons;
  int totalTutors;

  TextStyle _style(color, fontSize, fontWeight) => TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(background), fit: BoxFit.fitWidth),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_back, size: 28),
                  backgroundColor: Colors.transparent,
                  elevation: 0.2),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.095,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(totalLessons.toString(), style: _style(Colors.green, 24.0, FontWeight.w800)),
                      Text("Topic", style: _style(Colors.green, 18.0, FontWeight.w500))
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Column(
                    children: <Widget>[
                      Text(totalTutors.toString(), style: _style(Colors.black87, 24.0, FontWeight.w800)),
                      Text("Tutor", style: _style(Colors.black87, 18.0, FontWeight.w500))
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
