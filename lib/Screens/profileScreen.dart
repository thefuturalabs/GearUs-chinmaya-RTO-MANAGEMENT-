import 'package:flutter/material.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:gearus_app/uitilites/appconstant.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isAdult = false;
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                              controller: addressController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the address";
                                }
                              },
                              maxLines: 3,
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
                            child: TextFormField(
                              controller: dobController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the date of birth";
                                }
                              },
                              readOnly: true,
                              onTap: () {
                                dateselecting();
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
                                  hintText: "Date of birth",
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
                                if (valid == true) {
                                  if (isAdult == false) {
                                    Services.errorMessage(
                                        "Must have 18+ years", context);
                                  } else {}
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
                                    "Update",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
