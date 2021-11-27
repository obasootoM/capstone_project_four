import 'package:flutter/material.dart';

class GestureText extends StatelessWidget {
  const GestureText({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 15,
          ),
        ));
  }
}
