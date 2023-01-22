import 'package:flutter/material.dart';
import 'package:gearus_app/Screens/reqScreen.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:gearus_app/uitilites/appconstant.dart';

import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColors,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Gearus",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the username";
                                }
                              },
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
                                  hintText: "User Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: isPasswordVisible,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Password";
                                }
                              },
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
                                  suffixIcon: isPasswordVisible == true
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPasswordVisible = false;
                                            });
                                          },
                                          child: Icon(
                                            Icons.visibility,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              isPasswordVisible = true;
                                            });
                                          },
                                          child: Icon(
                                            Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                        ),
                                  hintText: "Password",
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
                                final valid = formKey.currentState!.validate();

                                if (valid == true) {
                                  var data = await Services.login(
                                      nameController.text,
                                      passwordController.text,
                                      context);

                                  if (data == true) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      // the new route
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen(),
                                      ),

                                      (Route route) => false,
                                    );
                                  }
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 28.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an Account ?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => ReqScreen(),
                                        ));
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
