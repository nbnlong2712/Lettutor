import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/schedule.dart';

class BookingCard extends StatefulWidget {
  BookingCard({Key? key, required this.schedule}) : super(key: key);

  Schedule schedule;

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {

  @override
  void initState() {
    super.initState();
    dao.openDB();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.schedule.isBooked = true;
        widget.schedule.studentId = mainUser.id;
        dao.updateSchedule(widget.schedule);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(width: 0.2, color: Colors.green)
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("${widget.schedule.startTime.year}/${widget.schedule.startTime.month}/${widget.schedule.startTime.day}"),
                Chip(
                  backgroundColor: const Color.fromRGBO(0, 187, 0, 220),
                  label: Text("${widget.schedule.startTime.hour} : ${widget.schedule.startTime.minute}",
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(width: 1, color: Colors.green)),
                ),
                const Text(" - "),
                Chip(
                  backgroundColor: Colors.orange.shade100,
                  label: Text("${widget.schedule.endTime.hour} : ${widget.schedule.endTime.minute}",
                      style: const TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w500)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), side: const BorderSide(width: 1, color: Colors.deepOrangeAccent)),
                ),
              ],
            ),
          ),
          color: widget.schedule.isBooked ? Colors.grey : Colors.white,
        ),
      ),
    );
  }
}
