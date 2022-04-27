import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/booking_request.dart';

class BookingHourCard extends StatelessWidget {
  BookingHourCard({
    Key? key,
    required this.scheduleDetailId,
    required this.isBook,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  String scheduleDetailId;
  bool isBook;
  String startTime;
  String endTime;

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!isBook) {
          await BookingRequest.bookMeeting(scheduleDetailId, "").then((value) {
            if (value.statusCode == 200) {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message}!", Colors.green));
            }
          }).catchError((e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(_snackBar("Book a meeting failed!", Colors.red));
          });
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: const BorderSide(width: 0.2, color: Colors.green)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$startTime - $endTime",
                    style: TextStyle(color: isBook? Colors.white : Colors.green, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          color: isBook ? Colors.black12 : Colors.white,
        ),
      ),
    );
  }
}
