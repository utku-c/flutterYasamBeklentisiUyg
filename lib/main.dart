import 'package:flutter/material.dart';

import './inputPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[200],
        primaryColor: Colors.lightBlue[400],
      ),
      home: InputPage(),
    );
  }
}
