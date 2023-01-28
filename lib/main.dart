import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gearus_app/Screens/homeScreen.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/applyScreen1.dart';
import 'Screens/loginScreen.dart';
import 'Screens/profileScreen.dart';
import 'Screens/quizScreen.dart';
import 'Screens/sample.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var id = await Services.getDtails();
  configLoading();

  runApp( MyApp(id: id["id"] ?? "null",));
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
    //..customAnimation = CustomAnimation();
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
      builder: EasyLoading.init(),
    );
  }
}
