import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/models/feedback.dart' as FB;
import 'package:flutter_lettutor/models/schedule.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/widget/long_floating_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../home_page.dart';

class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key? key, required this.schedule}) : super(key: key);

  Schedule schedule;

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
  void didChangeDependencies() {
    super.didChangeDependencies();
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
                child: CircleAvatar(backgroundImage: FileImage(File(mainUser.avatar)), radius: 35),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(mainUser.name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    Row(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(4.0), child: Icon(Icons.calendar_today_outlined, color: Colors.black54, size: 20)),
                        Text(
                          "${widget.schedule.startTimestamp.year}/${widget.schedule.startTimestamp.month}/${widget.schedule.startTimestamp.day}",
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(4.0), child: Icon(Icons.watch_later_outlined, color: Colors.black54, size: 20)),
                        Text(
                          "${widget.schedule.startTimestamp.hour}:${widget.schedule.startTimestamp.minute} - ${widget.schedule.endTimestamp.hour}:${widget.schedule.endTimestamp.minute}",
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
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              rate = rating;
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
              onPressed: () {
                if (commentController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please filled enough!", Colors.red));
                } else {
                  double star = 0;
                  int length = 0;
                  star += rate;
                  length++;
                  FB.Feedback feedback = FB.Feedback("id", "bookingId", tutor.id, mainUser.id, 5, "content", DateTime.now());
                  ScaffoldMessenger.of(context).showSnackBar(_snackBar("Feedback sent!", Colors.green));
                  Navigator.pop(context);
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
