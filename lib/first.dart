import 'package:flutter/material.dart';

import 'main.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.red.shade900,
            ),
            child: Text(
              "Welcome ${Global.user}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Text(
            "Logged in successfully...",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
