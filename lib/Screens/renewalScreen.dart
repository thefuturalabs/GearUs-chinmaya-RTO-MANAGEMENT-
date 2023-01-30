import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../uitilites/appconstant.dart';

class RenewalScreen extends StatefulWidget {
  const RenewalScreen({Key? key}) : super(key: key);

  @override
  State<RenewalScreen> createState() => _RenewalScreenState();
}

class _RenewalScreenState extends State<RenewalScreen> {
  File? pickMedicalReport;
  File? licensephoto;
  pickImages(int seleted) async {
    ImagePicker imagePicker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pick Image From"),
          content: Container(
            height: 100,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    XFile? image = await imagePicker.pickImage(
                        source: ImageSource.gallery);

                    if (image != null) {
                      setState(() {
                        // if(seleted == 1){
                        //   pickQualification = File(image.path);
                        // }
                        if (seleted == 1) {
                          licensephoto = File(image.path);
                        }
                        if (seleted == 2) {
                          pickMedicalReport = File(image.path);
                        }

                        Navigator.pop(context);
                      });
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
                        "Gallery",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    XFile? image =
                        await imagePicker.pickImage(source: ImageSource.camera);

                    if (image != null) {
                      setState(() {
                        // if(seleted == 1){
                        //   pickQualification = File(image.path);
                        // }
                        if (seleted == 1) {
                          licensephoto = File(image.path);
                        }
                        if (seleted == 2) {
                          pickMedicalReport = File(image.path);
                        }
                        Navigator.pop(context);
                      });
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
                        "Camera",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  dateselecting() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2025));
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date!);
    setState(() {
      dobController.text = formatted;
    });
  }

  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Renewal form",
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
                      controller: licenseNumberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter the License number";
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
                                  color: AppConstants.backgroundColors, width: 2)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.backgroundColors, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.backgroundColors, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.backgroundColors, width: 2),
                          ),
                          hintText: "License Number",
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //controller: emailController,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please enter the email";
                      //   }
                      // },
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
                                  color: AppConstants.backgroundColors, width: 2)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.backgroundColors, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.backgroundColors, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppConstants.backgroundColors, width: 2),
                          ),
                          hintText: "500",
                          labelText: "Amount",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: phoneController,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "Please enter the phone";
                  //       }
                  //     },
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 17,
                  //         fontWeight: FontWeight.w500),
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //         errorStyle: TextStyle(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w500,
                  //             color: AppConstants.backgroundColors),
                  //         errorBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 color: AppConstants.backgroundColors, width: 2)),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         hintText: "phone",
                  //         hintStyle: TextStyle(
                  //             color: Colors.grey,
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500)),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: licenseNumberController,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "Please enter the license number";
                  //       }
                  //     },
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 17,
                  //         fontWeight: FontWeight.w500),
                  //     decoration: InputDecoration(
                  //         errorStyle: TextStyle(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w500,
                  //             color: AppConstants.backgroundColors),
                  //         errorBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 color: AppConstants.backgroundColors, width: 2)),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         hintText: "license number",
                  //         hintStyle: TextStyle(
                  //             color: Colors.grey,
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500)),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: TextFormField(
                  //     controller: dobController,
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return "Please enter the expiry date";
                  //       }
                  //     },
                  //     style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 17,
                  //         fontWeight: FontWeight.w500),
                  //     readOnly: true,
                  //     onTap: () {
                  //       dateselecting();
                  //     },
                  //     decoration: InputDecoration(
                  //         errorStyle: TextStyle(
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w500,
                  //             color: AppConstants.backgroundColors),
                  //         errorBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //                 color: AppConstants.backgroundColors, width: 2)),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: AppConstants.backgroundColors, width: 2),
                  //         ),
                  //         hintText: "expiry date",
                  //         hintStyle: TextStyle(
                  //             color: Colors.grey,
                  //             fontSize: 17,
                  //             fontWeight: FontWeight.w500)),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppConstants.backgroundColors, width: 2),
                              image: DecorationImage(
                                  image: licensephoto == null
                                      ? AssetImage("assets/placeholder.jpg")
                                      : FileImage(licensephoto!) as ImageProvider,
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "License photo",
                                style: TextStyle(fontSize: 18),
                              )),
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppConstants.backgroundColors, width: 2),
                              shape: BoxShape.circle,
                              color: Colors.grey.shade300),
                          child: IconButton(
                              onPressed: () {
                                pickImages(1);
                              },
                              icon: Icon(Icons.file_upload)),
                        ))
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         height: 120,
                  //         width: 120,
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //                 color: AppConstants.backgroundColors, width: 2),
                  //             image: DecorationImage(
                  //                 image: pickMedicalReport == null
                  //                     ? AssetImage("assets/placeholder.jpg")
                  //                     : FileImage(pickMedicalReport!)
                  //                         as ImageProvider,
                  //                 fit: BoxFit.fill)),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Container(
                  //             height: 50,
                  //             width: MediaQuery.of(context).size.width / 2,
                  //             child: Text(
                  //               "Medical Report",
                  //               style: TextStyle(fontSize: 18),
                  //             )),
                  //       ),
                  //       Expanded(
                  //           child: Container(
                  //         decoration: BoxDecoration(
                  //             border: Border.all(
                  //                 color: AppConstants.backgroundColors, width: 2),
                  //             shape: BoxShape.circle,
                  //             color: Colors.grey.shade300),
                  //         child: IconButton(
                  //             onPressed: () {
                  //               pickImages(2);
                  //             },
                  //             icon: Icon(Icons.file_upload)),
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: InkWell(
                      onTap: () {
                        final valid = formkey.currentState!.validate();
                        final DateFormat formatter = DateFormat('yyyy-MM-dd');
                        final String formatted = formatter.format(DateTime.now());
                        if(valid){
                          Services.renewLicences("500", formatted, licensephoto!, context);
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
                            "Apply",
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
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
