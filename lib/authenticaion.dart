
import 'package:capstone_project_four/my_home_page/sign_up.dart';
import 'package:capstone_project_four/register.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  bool signIn = true;

  @override
  Widget build(BuildContext context) {
    if (signIn) {
      return SignUp();
    } else {
      return Register();
    }
  }
}
