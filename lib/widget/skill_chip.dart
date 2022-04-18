import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  SkillChip({Key? key, required this.skillName}) : super(key: key);

  String skillName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Chip(
        label: Text(
          skillName,
          style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color.fromRGBO(0, 187, 0, 220).withOpacity(0.06),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            side: BorderSide(color: Colors.lightGreen, width: 0.5)
        ),
      ),
    );
  }
}
