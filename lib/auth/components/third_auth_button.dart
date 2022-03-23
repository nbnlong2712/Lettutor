import 'package:flutter/material.dart';

enum ThirdParty{
  Google, Facebook
}

extension ParseToString on ThirdParty {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

class ThirdAuthButton extends StatelessWidget {
  ThirdAuthButton({
    Key? key,
    required this.thirdParty,
    required this.onPressed,
  }) : super(key: key);

  ThirdParty thirdParty;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Image.asset("assets/images/" + thirdParty.toShortString().toLowerCase().trim() + "-icon.png"),
        iconSize: 60,
        onPressed: onPressed,
      ),
    );
  }
}