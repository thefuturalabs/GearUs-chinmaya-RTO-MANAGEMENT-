import 'package:flutter/material.dart';

import 'Screens/applyScreen1.dart';
import 'Screens/loginScreen.dart';
import 'Screens/quizScreen.dart';
import 'Screens/sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:ApplyScreen1(),
    );
  }
}
