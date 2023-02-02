import 'package:flutter/material.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:gearus_app/uitilites/appconstant.dart';
import 'package:intl/intl.dart';

import 'loginScreen.dart';

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
  TextEditingController dobController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  int groupLicenseValue = 0;
  bool isAdult = false;

  messages() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Note"),
            content: Container(
              height: 120,
              child: Column(
                children: [
                  Text(
                    "Please wait for admin approval",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      child: Center(
                        child: Text(
                          "Ok",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppConstants.backgroundColors,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(4, 4),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  dateselecting() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2025));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date!);
    var yearDiff = DateTime.now().year - date.year;
    var monthDiff = DateTime.now().month - date.month;
    var dayDiff = DateTime.now().day - date.day;
    if (yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0) {
      setState(() {
        isAdult = true;
      });
    }
    setState(() {
      dobController.text = formatted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColors,
      resizeToAvoidBottomInset: true,
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
                            keyboardType: TextInputType.number,
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
                            controller: dobController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the date of birth";
                              }
                            },
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                            readOnly: true,
                            onTap: () {
                              dateselecting();
                            },
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
                                hintText: "Date of birth",
                                suffixIcon: Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey,
                                ),
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
                            controller: qualificationController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the qualification";
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
                                hintText: "Qualification",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: addressController,
                            maxLines: 3,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter the address";
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
                                hintText: "Address",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Already have license",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "No",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Radio(
                                  value: 1,
                                  groupValue: groupLicenseValue,
                                  activeColor: AppConstants.backgroundColors,
                                  onChanged: (value) {
                                    setState(() {
                                      groupLicenseValue = value!;
                                    });
                                  }),
                              Text(
                                "Yes",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Radio(
                                  value: 2,
                                  groupValue: groupLicenseValue,
                                  activeColor: AppConstants.backgroundColors,
                                  onChanged: (value) {
                                    setState(() {
                                      groupLicenseValue = value!;
                                    });
                                  }),
                            ],
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
                            obscureText: isPasswordVisible,
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
                            onTap: ()async {

                              final valid = formKey.currentState!.validate();

                              if (valid == true) {
                                if (groupLicenseValue == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "please fill all the details")));
                                } else {
                                  if (isAdult == false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Must have 18 years old")));
                                  } else {
                                    try {
                                   var data = await  Services.userRegistration(
                                          nameController.text,
                                          emailController.text,
                                          phoneController.text,

                                          addressController.text,
                                          dobController.text,
                                          qualificationController.text,
                                          groupLicenseValue == 1 ? "No":"Yes",
                                          passwordController.text,
                                          context);

                                   if(data== true){
                                     await messages();
                                     Navigator.of(context).pushAndRemoveUntil(
                                       // the new route
                                       MaterialPageRoute(
                                         builder: (BuildContext context) => LoginScreen(),
                                       ),

                                           (Route route) => false,
                                     );
                                   }

                                    } catch (e) {}
                                  }
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
