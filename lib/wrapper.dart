
import 'package:capstone_project_four/auth/user.dart';
import 'package:capstone_project_four/authenticaion.dart';
import 'package:capstone_project_four/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Sooto?>(context);
    if (user == null) {
      return Authentication();
    } else {
      return HomeScreen();
    }
  }
}
