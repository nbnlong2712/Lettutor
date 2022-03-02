import 'package:flutter/material.dart';

class SelectionSkillChip extends StatefulWidget {
  SelectionSkillChip({Key? key, required this.isSelected, required this.skillName})
      : super(key: key);

  String skillName;
  bool isSelected;

  @override
  _SelectionSkillChipState createState() => _SelectionSkillChipState();
}

class _SelectionSkillChipState extends State<SelectionSkillChip> {
  Text _selectedText(text, color, fontWeight) => Text(
        text,
        style: TextStyle(color: color, fontWeight: fontWeight),
      );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color.fromRGBO(0, 187, 0, 220)
                : Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: widget.isSelected
                  ? Row(
                      children: <Widget>[
                        _selectedText(
                            widget.skillName, Colors.green, FontWeight.w400),
                        const Icon(Icons.check, color: Colors.green,)
                      ],
                    )
                  : _selectedText(
                      widget.skillName, Colors.black87, FontWeight.w400),
            ),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          if (widget.isSelected) {
            widget.isSelected = false;
          } else {
            widget.isSelected = true;
          }
        });
      },
    );
  }
}
