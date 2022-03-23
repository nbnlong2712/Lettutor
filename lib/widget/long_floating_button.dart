import 'package:flutter/material.dart';

class LongFloatingButton extends StatelessWidget {
  LongFloatingButton({Key? key, required this.onPressed, required this.child, required this.color}) : super(key: key);

  final Function() onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
          fixedSize: Size(MediaQuery.of(context).size.width, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
