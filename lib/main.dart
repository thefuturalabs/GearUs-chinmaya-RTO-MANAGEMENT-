import 'package:flutter/material.dart';
import 'package:gearus_app/Screens/homeScreen.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/applyScreen1.dart';
import 'Screens/loginScreen.dart';
import 'Screens/quizScreen.dart';
import 'Screens/sample.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var id = await Services.getDtails();

  runApp( MyApp(id: id["id"] ?? "null",));
}

class MyApp extends StatelessWidget {
  String id;
   MyApp({super.key,required this.id});

  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',


      theme: ThemeData(

        primarySwatch: Colors.blue,
        // useMaterial3: true

      ),
      home: id == "null" ? LoginScreen():HomeScreen(),
    );
  }
}
