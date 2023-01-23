import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gearus_app/controller/services.dart';

import '../uitilites/appconstant.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {


  TextEditingController feedbackController = TextEditingController();
  final formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Feedback",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppConstants.backgroundColors),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: feedbackController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the feedback";
                    }
                  },
                  maxLines: 8,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppConstants.backgroundColors),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppConstants.backgroundColors,
                              width: 2)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.backgroundColors,
                            width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.backgroundColors,
                            width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppConstants.backgroundColors,
                            width: 2),
                      ),
                      hintText: "FeedBack",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: InkWell(
                  onTap: () async {
                    final validate = formkey.currentState!.validate();

                    if(validate){

                      Services.feedback(feedbackController.text, context);
                    }


                  },
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: AppConstants.backgroundColors,
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
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
