import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton(
      {Key? key,
      required this.onPressed,
      required this.label,})
      : super(key: key);

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
          fixedSize: Size(MediaQuery.of(context).size.width, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )
        ),
      ),
    );
  }
}
