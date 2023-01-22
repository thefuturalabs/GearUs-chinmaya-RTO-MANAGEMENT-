import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gearus_app/Screens/loginScreen.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  static final String url = "http://192.168.29.86/Gearus-chinmaya/API/";


 static setdetails(String id,name,email,licence_status)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    await sharedPreferences.setString("id", id);
    await sharedPreferences.setString("name", name);
    await sharedPreferences.setString("email", email);
    await sharedPreferences.setString("licence_status", licence_status);
  }

  static Future<Map> getDtails()async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    Map details ={};
    var id = await sharedPreferences.getString("id");
    var name =await sharedPreferences.getString("name");
   var email = await sharedPreferences.getString("email");
    var licence_status = await sharedPreferences.getString("licence_status");

    details["id"]=id;
    details["name"]=name;
    details["email"]=email;
    details["licence_status"]=licence_status;

    return details;
  }

 static errorMessage(String message,BuildContext context){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  static Future<dynamic> userRegistration(String name, email, phone, address,
      dob, qualification, licenseStatus, password, BuildContext context) async {
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      // "status":status,
      "address": address,
      "dob": dob,
      "qualification": qualification,
      "licence_status": licenseStatus,
      "password": password
    };

    var response =
        await post(Uri.parse("${url}user_registration.php"), body: body);
    if (response.statusCode == 200) {
      var rbody = jsonDecode(response.body);

      if (rbody["message"] == "sucess") {
        return true;
      }else{
        errorMessage("somthing went wrong, please try again", context);
      }
    }
  }



 static Future<dynamic> login(String username,password,BuildContext context)async{
    var body={
      "user_name":username,
      "password":password
    };
    var response =
        await post(Uri.parse("${url}login.php"), body: body);


    if(response.statusCode == 200){
      var rbody = jsonDecode(response.body);

      if (rbody["message"] == "sucess") {
        
        setdetails(rbody["r_id"],rbody["name"],rbody["email"],rbody["licence_status"]);

        return true;

      }else{
        errorMessage("somthing went wrong, please try again", context);
      }
    }
  }

 static Future applyForLCC(String address,email,Birth_place,phone,Blood_group,city,dob,first_name,iden_mark,last_name,LLc_type, File image, File qualificattionPhoto, qulaification,state,BuildContext context)async{


   var details = await getDtails();
   var id =await details["id"];

    final fullurl = "${url}add_LLC.php";
    var request = MultipartRequest("POST", Uri.parse(fullurl));
    request.fields["address"] = address;
    request.fields["email"] = email;
    request.fields["Birth_place"] = Birth_place;
    request.fields["phone"] = phone;
    request.fields["Blood_group"] = Blood_group;
    request.fields["city"] = city;
    request.fields["DOB"] = dob;
    request.fields["first_name"] = first_name;
    request.fields["iden_mark"] = iden_mark;
    request.fields["last_name"] = last_name;
    request.fields["LLc_type"] = LLc_type;
    request.fields["qualificattion"] = qulaification;
    request.fields["state"] = state;
    request.fields["r_id"] = id;


    request.files.add(MultipartFile.fromBytes(
        "proof", File(qualificattionPhoto!.path).readAsBytesSync(),
        filename: image!.path));
    request.files.add(MultipartFile.fromBytes(
        "image", File(image!.path).readAsBytesSync(),
        filename: image!.path));




    request.send().then((response) async {
      if (response.statusCode == 200) {
        print("Uploaded!");
        final data = await Response.fromStream(response);

        var rbody = jsonDecode(data.body);
        if (rbody["message"] == "sucess") {
          print(data.body);

        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Somthing went wrong please try again")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Somthing went wrong please try again")));
      }
    });


  }


}
