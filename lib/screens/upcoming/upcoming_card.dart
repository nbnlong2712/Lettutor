import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/booking_request.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class UpcomingCard extends StatelessWidget {
  UpcomingCard({Key? key, required this.booking}) : super(key: key);

  Booking booking;

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

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
                    child: CircleAvatar(backgroundImage: NetworkImage(booking.tutorAvatar!), radius: 35),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(booking.tutorName!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                      Row(
                        children: <Widget>[
                          Text("${booking.startPeriodTimestamp!.year}/${booking.startPeriodTimestamp!.month}/${booking.startPeriodTimestamp!.day}"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              backgroundColor: const Color.fromRGBO(0, 187, 0, 220),
                              label: Text("${booking.startPeriodTimestamp!.hour} : ${booking.startPeriodTimestamp!.minute}",
                                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), side: const BorderSide(width: 1, color: Colors.green)),
                            ),
                          ),
                          const Text(" - "),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Chip(
                              backgroundColor: Colors.orange.shade100,
                              label: Text("${booking.endPeriodTimestamp!.hour} : ${booking.endPeriodTimestamp!.minute}",
                                  style: const TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), side: const BorderSide(width: 1, color: Colors.deepOrangeAccent)),
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
                    style: NeumorphicStyle(depth: 3, shape: NeumorphicShape.flat, intensity: 0.9, color: Colors.red.shade100),
                    onPressed: () async {
                      await BookingRequest.cancelBooking(booking.scheduleDetailId!).then((value) {
                        if(value.statusCode == 200)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(_snackBar("Login success!", Colors.green));
                            Navigator.popAndPushNamed(context, HomePage.router);
                          }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message}!", Colors.red));
                        }
                      }).catchError((e){
                        print("${e.toString()} error cancel booking");
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar("Cancel booking failed!", Colors.red));
                      });
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: const Center(
                        child: Text("Cancel", style: TextStyle(color: Colors.red)),
                      ),
                    ),
                  ),
                  NeumorphicButton(
                    style: NeumorphicStyle(depth: 3, shape: NeumorphicShape.flat, intensity: 0.9, color: Colors.green.shade100),
                    onPressed: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      child: const Center(
                        child: Text("Go to meeting", style: TextStyle(color: Colors.green)),
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
