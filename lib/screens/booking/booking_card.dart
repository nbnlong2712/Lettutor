import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/screens/booking/booking_hour_screen.dart';

class BookingCard extends StatefulWidget {
  BookingCard({Key? key, required this.schedule}) : super(key: key);

  Schedule schedule;

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pop(context);
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => SingleChildScrollView(
            child: BookingHourScreen(
              schedule: widget.schedule,
            ),
          ),
        );
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
                    "${widget.schedule.startTimestamp!.day}/${widget.schedule.startTimestamp!.month}/${widget.schedule.startTimestamp!.year}",
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
