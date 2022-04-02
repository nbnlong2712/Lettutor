import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/feedback.dart' as FB;
import 'package:flutter_lettutor/models/user.dart';

class CommentCard extends StatefulWidget {
  CommentCard({Key? key, required this.feedback}) : super(key: key);

  FB.Feedback feedback;

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  late User user;

  @override
  void initState() {
    super.initState();
    dao.openDB();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = dao.getUserById(widget.feedback.authId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(backgroundImage: FileImage(File(user.avatar)), radius: 22),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(user.name, style: const TextStyle(fontSize: 17)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(widget.feedback.stars.toString(), style: const TextStyle(color: Colors.red, fontSize: 17),),
                        ),
                        const Icon(Icons.star, color: Colors.orangeAccent,)
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(widget.feedback.content, style: const TextStyle(fontSize: 16)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "${widget.feedback.createAt.year}/${widget.feedback.createAt.month}/${widget.feedback.createAt.day} ${widget.feedback.createAt.hour}:${widget.feedback.createAt.minute}",
                    style: const TextStyle(color: Colors.black38),
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
