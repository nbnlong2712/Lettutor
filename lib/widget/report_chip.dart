import 'package:flutter/material.dart';

class ReportChip extends StatelessWidget {
  ReportChip({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  String label;
  Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Chip(
          label: Text(
            label,
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color.fromRGBO(0, 187, 0, 220),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), side: const BorderSide(color: Colors.lightGreen)),
        ),
      ),
      onTap: onTap(label),
    );
  }
}
