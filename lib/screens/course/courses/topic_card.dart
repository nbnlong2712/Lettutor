import 'package:flutter/material.dart';

class TopicCard extends StatelessWidget {
  TopicCard({
    Key? key,
    required this.orderNumber,
    required this.topicName,
  }) : super(key: key);

  int orderNumber;
  String topicName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Chip(
                backgroundColor: Colors.green,
                label: Text(
                  orderNumber.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w600),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Flexible(
              child: Text(
                topicName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}