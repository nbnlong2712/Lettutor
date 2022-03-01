import 'package:flutter/material.dart';

class SkillTag extends StatelessWidget {
  SkillTag({Key? key, required this.skillName}) : super(key: key);

  String skillName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 187, 0, 220),
            border: Border.all(color: Colors.lightGreen),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(skillName, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),),
        ),
      ),
    );
  }
}