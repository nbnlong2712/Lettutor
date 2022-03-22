import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  CommentCard({
    Key? key,
    required this.avatar,
    required this.name,
    required this.comment,
    required this.time,
  }) : super(key: key);

  String avatar;
  String name;
  String comment;
  String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
                      CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                        radius: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(name, style: TextStyle(fontSize: 17),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                          size: 22,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(comment, style: TextStyle(fontSize: 16),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(time, style: TextStyle(color: Colors.black38),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
