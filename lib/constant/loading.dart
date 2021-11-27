import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitChasingDots(
            color: Colors.grey,
            size: 20,
          ),
          Text(
            'Loading...', style: TextStyle(fontSize: 20, color: Colors.black),)
        ],
      ),
    );
  }
}
