// ignore_for_file: deprecated_member_use

import 'package:capstone_project_four/auth/auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('SignOut'))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Welcome Home',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
