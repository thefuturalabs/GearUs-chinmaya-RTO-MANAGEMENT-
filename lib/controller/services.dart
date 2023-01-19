import 'dart:convert';

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
}
