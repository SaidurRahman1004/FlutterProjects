import 'package:flutter/material.dart';
import 'Digital Business Card/profile_app.dart';
import 'Extra/TestCode.dart';

void main() {
  runApp(
    MaterialApp(
      home: ProfileApp(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          //https://i.postimg.cc/jjKRZgRq/profile-pic-1.png
        ],
      )),

    );
  }
}
