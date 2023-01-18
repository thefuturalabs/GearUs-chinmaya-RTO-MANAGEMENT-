import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gearus_app/uitilites/appconstant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ApplyScreen1 extends StatefulWidget {
  const ApplyScreen1({Key? key}) : super(key: key);

  @override
  State<ApplyScreen1> createState() => _ApplyScreen1State();
}

class _ApplyScreen1State extends State<ApplyScreen1> {
  String? seletedVehicleType;
  List<String> ListOfVechileType = [
    "Two Wheels",
    "Three Wheels",
    "Four Wheels",
    "Heavy Licence"
  ];
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

  File? pickQualification;
  File? pickImage;
  File? pickMedicalReport;
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
                        if(seleted == 1){
                          pickQualification = File(image.path);
                        }
                        if(seleted == 2){
                          pickImage = File(image.path);
                        }
                        if(seleted == 3){
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
                        if(seleted == 1){
                          pickQualification = File(image.path);
                        }
                        if(seleted == 2){
                          pickImage = File(image.path);
                        }
                        if(seleted == 3){
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

  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Fill the Details",
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
                    // controller: nameController,
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
                    onTap: (){
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
                    // controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the phone number";
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
                    // controller: nameController,
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
                        hintText: "Email",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the fathers name";
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
                        hintText: "Father's name",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the Occupation";
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
                        hintText: "Occupation",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: nameController,
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
                    // controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter the blood group";
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
                        hintText: "Blood group",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppConstants.backgroundColors, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButtonHideUnderline(
                        child: IgnorePointer(
                          ignoring: false,
                          child: DropdownButton<String>(
                            isExpanded: true,
                            elevation: 0,

                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),

                            hint: Text(
                              ' Please choose Vehicle type',
                            ), // Not necessary for Option 1
                            value: seletedVehicleType,
                            onChanged: (newValue) {
                              setState(() {
                                seletedVehicleType = newValue;
                              });
                            },
                            items: ListOfVechileType.map((location) {
                              return DropdownMenuItem(
                                child: Container(
                                  child: new Text(
                                    location,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
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
                                image:pickQualification == null ? AssetImage("assets/placeholder.jpg"):FileImage(pickQualification!) as ImageProvider,
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Qualification Proof(SSLC/PlUS TWO)",
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
                            }, icon: Icon(Icons.file_upload)),
                      ))
                    ],
                  ),
                ),
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
                                image: pickImage == null ? AssetImage("assets/placeholder.jpg"):FileImage(pickImage!) as ImageProvider,
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Photo",
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
                                  pickImages(2);
                                }, icon: Icon(Icons.file_upload)),
                          ))
                    ],
                  ),
                ),
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
                                image: pickMedicalReport == null ? AssetImage("assets/placeholder.jpg"):FileImage(pickMedicalReport!) as ImageProvider,
                                fit: BoxFit.fill)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Medical Report",
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
                                  pickImages(3);
                                }, icon: Icon(Icons.file_upload)),
                          ))
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: InkWell(
                    onTap: () {
                      // final valid = formKey.currentState!.validate();
                      //
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => HomeScreen(),
                      // ));


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
    );
  }
}