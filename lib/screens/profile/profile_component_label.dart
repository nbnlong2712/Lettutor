import 'package:flutter/material.dart';

class ProfileComponentLabel extends StatelessWidget {
  ProfileComponentLabel({Key? key, required this.label}) : super(key: key);

  String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          label,
          style: const TextStyle(fontSize: 17),
        ),
    );
  }
}
