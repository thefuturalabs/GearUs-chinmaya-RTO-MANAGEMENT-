import 'package:flutter/material.dart';
import 'package:gearus_app/uitilites/appconstant.dart';

class ReqScreen extends StatefulWidget {
  const ReqScreen({Key? key}) : super(key: key);

  @override
  State<ReqScreen> createState() => _ReqScreenState();
}

class _ReqScreenState extends State<ReqScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confimPassswordContoller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColors,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
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
              height: MediaQuery.of(context).size.height / 1.3,
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
                          height: 30,
                        ),
                        Text(
                          "Register here..",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the name";
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppConstants.backgroundColors,
                                      width: 2),
                                ),
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
                                hintText: "Name",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the phone number";
                              }
                              if (value.length != 10) {
                                return "please enter the correct phone number";
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppConstants.backgroundColors,
                                      width: 2),
                                ),
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
                                hintText: "Phone number",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the email";
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppConstants.backgroundColors,
                                      width: 2),
                                ),
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
                                hintText: "E-mail",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the password";
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
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppConstants.backgroundColors,
                                      width: 2),
                                ),
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
                            onTap: () {
                              final valid = formKey.currentState!.validate();
                              if (valid == true) {}
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
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
// Center(
// child: Form(
// key: formKey,
// child: SingleChildScrollView(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// ],
// ),
// ),
// ),
// ),
