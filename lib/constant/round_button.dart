// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
  }) : super(key: key);
  final String text;
  final Function() press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 70,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        onPressed: press,
        color: color,
      ),
    );
  }
}
