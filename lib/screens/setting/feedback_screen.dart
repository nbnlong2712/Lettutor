import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/feedback_request.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/models/booking.dart';
import 'package:flutter_lettutor/models/feedback.dart' as FB;
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key? key, required this.booking}) : super(key: key);

  Booking booking;

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController commentController = TextEditingController();
  late Tutor tutor;

  InputDecoration _decoration(bool readOnly, String hint) {
    return InputDecoration(
      fillColor: Colors.black12,
      filled: readOnly,
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black26, width: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.green, width: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  double rate = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Give Feedback", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: CircleAvatar(backgroundImage: NetworkImage(widget.booking.tutorAvatar!), radius: 35),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(widget.booking.tutorName!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    Row(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(4.0), child: Icon(Icons.calendar_today_outlined, color: Colors.black54, size: 20)),
                        Text(
                          "${widget.booking.startPeriodTimestamp!.year}/${widget.booking.startPeriodTimestamp!.month}/${widget.booking.startPeriodTimestamp!.day}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(4.0), child: Icon(Icons.watch_later_outlined, color: Colors.black54, size: 20)),
                        Text(
                          "${widget.booking.startPeriodTimestamp!.hour}:${widget.booking.startPeriodTimestamp!.minute} - ${widget.booking.endPeriodTimestamp!.hour}:${widget.booking.endPeriodTimestamp!.minute}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              setState(() {
                rate = rating;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 7,
              controller: commentController,
              decoration: _decoration(false, "Type your feedback..."),
            ),
          ),
          LongFloatingButton(
              onPressed: () async {
                if (commentController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please filled enough!", Colors.red));
                } else {
                  await FeedbackRequest.postFeedback(widget.booking.id!, widget.booking.tutorId!, rate.toInt(), commentController.text).then((value) {
                    if (value == true) {
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar("Feedback sent!", Colors.green));
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(_snackBar("Feedback send failed!", Colors.red));
                    }
                  }).catchError((e) {
                    ScaffoldMessenger.of(context).showSnackBar(_snackBar("Feedback send failed!", Colors.red));
                  });
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.comment),
                  ),
                  Text("Give feedback")
                ],
              ),
              color: Colors.green),
        ],
      ),
    );
  }
}
