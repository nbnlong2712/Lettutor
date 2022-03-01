import 'package:flutter/material.dart';

class LongFloatingButton extends StatelessWidget {
  LongFloatingButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  final Function() onPressed;
  final Text label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: onPressed,
        child: label,
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            fixedSize: Size(MediaQuery.of(context).size.width, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
        ),
      ),
    );
  }
}
