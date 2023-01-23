import 'package:flutter/material.dart';
import 'package:gearus_app/Screens/quizScreen.dart';
import 'package:gearus_app/uitilites/appconstant.dart';

class QuizStartingScreen extends StatefulWidget {
  const QuizStartingScreen({Key? key}) : super(key: key);

  @override
  State<QuizStartingScreen> createState() => _QuizStartingScreenState();
}

class _QuizStartingScreenState extends State<QuizStartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColors,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lets start the test",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: InkWell(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuizScreen(),));
                  },
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        "Start",
                        style: TextStyle(
                          color: AppConstants.backgroundColors,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
