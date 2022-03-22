import 'package:flutter/material.dart';

class UpcomingBanner extends StatelessWidget {
  UpcomingBanner({Key? key}) : super(key: key);

  TextStyle textWhiteStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Total lesson time are 83 hours 20 minutes",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
            Text("Upcoming lesson", style: textWhiteStyle),
            Text("Thu, 3/3/2022 - 23:00", style: textWhiteStyle),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.white,
                onPressed: () {},
                label: Text(
                  "Enter lesson room",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
