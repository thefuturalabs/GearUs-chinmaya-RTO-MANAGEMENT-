import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gearus_app/Screens/loginScreen.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/homeScreen.dart';
import '../Screens/quizStartingScreen.dart';

class Services {
  static final String url = "http://192.168.29.86/Gearus-chinmaya/API/";

  static setdetails(String id, name, email, licence_status) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("id", id);
    await sharedPreferences.setString("name", name);
    await sharedPreferences.setString("email", email);
    await sharedPreferences.setString("licence_status", licence_status);
  }

  static Future<Map> getDtails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map details = {};
    var id = await sharedPreferences.getString("id");
    var name = await sharedPreferences.getString("name");
    var email = await sharedPreferences.getString("email");
    var licence_status = await sharedPreferences.getString("licence_status");
    var applyfotllc = await sharedPreferences.getString("applyforllc");

    details["id"] = id;
    details["name"] = name;
    details["email"] = email;
    details["licence_status"] = licence_status;
    details["applyforllc"] = applyfotllc;

    return details;
  }

  static errorMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
      } else {
        errorMessage("somthing went wrong, please try again", context);
      }
    }
  }

  static Future<dynamic> login(
      String username, password, BuildContext context) async {
    var body = {"user_name": username, "password": password};
    var response = await post(Uri.parse("${url}login.php"), body: body);

    if (response.statusCode == 200) {
      var rbody = jsonDecode(response.body);

      if (rbody["message"] == "sucess") {
        setdetails(rbody["r_id"], rbody["name"], rbody["email"],
            rbody["licence_status"]);

        return true;
      } else {
        errorMessage("somthing went wrong, please try again", context);
      }
    }
  }

  static Future<dynamic> applyForLCC(
      String address,
      email,
      Birth_place,
      phone,
      Blood_group,
      city,
      dob,
      first_name,
      iden_mark,
      last_name,
      LLc_type,
      File image,
      File qualificattionPhoto,
      qulaification,
      state,
      BuildContext context) async {
    var details = await getDtails();
    var id = await details["id"];

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
  request.fields["mark"] = "0";

    // request.files.add(MultipartFile.fromBytes(
    //     "proof", File(qualificattionPhoto!.path).readAsBytesSync(),
    //     filename: image!.path));
    request.files.add(MultipartFile.fromBytes(
        "image", File(image!.path).readAsBytesSync(),
        filename: image!.path));

    request.send().then((response) async {
      EasyLoading.show(status: 'loading...');
      if (response.statusCode == 200) {
        print("Uploaded!");

        final data = await Response.fromStream(response);
        print(data.body);

        var rbody = jsonDecode(data.body);
        if (rbody["message"] == "success") {


         var result = await uploadproof(qualificattionPhoto, context, id);




          print(data.body);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Somthing went wrong please try again1")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Somthing went wrong please try again2")));
      }
    });
  }


 static Future<dynamic> uploadproof(File proof,BuildContext context,String id)async{
    final fullurl = "${url}add_LLC_proof.php";
    var request = MultipartRequest("POST", Uri.parse(fullurl));
    request.fields["r_id"] = id;
    request.files.add(MultipartFile.fromBytes(
        "image", File(proof!.path).readAsBytesSync(),
        filename: proof!.path));


    request.send().then((value) async {
      if(value.statusCode ==200){
        final data = await Response.fromStream(value);
        print(data.body);
        var rbody = jsonDecode(data.body);
        if(rbody["message"]=="update"){
          EasyLoading.dismiss();
          print("both uploadedd sucessfully");

          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

          await sharedPreferences.setString("applyforllc", "yes");
          print("sucess");

          viewLLC();
          Navigator.of(context).pushAndRemoveUntil(
            // the new route
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  HomeScreen(),
            ),

                (Route route) => false,
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => QuizStartingScreen(),)).then((value) {
            viewLLC();
          });


          return true;
        }
      }
    });


  }



  static feedback(String feedback, BuildContext context) async {
    var details = await getDtails();
    var id = await details["id"];
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(DateTime.now());

    var body = {"r_id": id, "feedback": feedback, "Date": formatted.toString()};

    print(body);

    EasyLoading.show(status: 'loading...', maskType: EasyLoadingMaskType.black,);

    var response = await post(Uri.parse("${url}add_feedback.php"), body: body);

    if (response.statusCode == 200) {
      var b = jsonDecode(response.body);

      if (b["message"] == "sucess") {
        EasyLoading.dismiss();
        Services.errorMessage("feedback added", context);
        Navigator.of(context).pushAndRemoveUntil(
          // the new route
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),

          (Route route) => false,
        );
      }
    }
  }

  static Future<dynamic> viewLLC() async {
    var details = await getDtails();
    var id = await details["id"];
    var body = {
      "r_id": id,
    };
    var response = await post(Uri.parse("${url}view_LLC.php"), body: body);
    if (response.statusCode == 200) {
      var rbody = jsonDecode(response.body);
      print("view llc -- ${rbody}");
      if (rbody["message"] == "sucess") {
        // SharedPreferences sharedPreferences =
        //     await SharedPreferences.getInstance();
        // if (rbody["status"] == "register") {
        //   print("applyed");
        //   await sharedPreferences.setString("applyforllc", "register");
        // }
        // if (rbody["status"] == "TEM approve") {
        //   print("applyed");
        //   await sharedPreferences.setString("applyforllc", "waitForAdminAproval");
        // }
        // if (rbody["status"] == "approve") {
        //   print("applyed");
        //   await sharedPreferences.setString("applyforllc", "approveLLC");
        // }

        return rbody;
      }
    }
  }

  static Future<dynamic> getuserFullDetails() async {
    var details = await getDtails();
    var id = await details["id"];
    var body = {
      "r_id": id,
    };
    var response = await post(Uri.parse("${url}view_userreg.php"), body: body);

    if (response.statusCode == 200) {
      var rbody = jsonDecode(response.body);

      if (rbody["message"] == "sucess") {
        return rbody;
      }
    }
  }

  static updateprofile(String name, email, phone, address, dob, qualification,
      licence_status, password, BuildContext context, String emailold) async {
    var details = await getDtails();
    var id = await details["id"];
    var body = {
      "name": name,
      "r_id": id,
      "email": email,
      "phone": phone,
      // "status":status,
      "licence_status": licence_status,
      "address": address,
      "dob": dob,
      "qualification": qualification,
      "password": password,
      "emailold": emailold
    };
    print(body);
    var response =
        await post(Uri.parse("${url}update_userreg.php"), body: body);
    if (response.statusCode == 200) {
      var rbody = jsonDecode(response.body);
      print(" response body update api ${rbody}");
      if (rbody["message"] == "sucess") {
       // setdetails(rbody["r_id"],rbody["name"], rbody["email"], rbody["licence_status"]);
        Services.errorMessage("Profile updated", context);
        Navigator.of(context).pushAndRemoveUntil(
          // the new route
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),

          (Route route) => false,
        );
      }
    }
  }

  static Future<dynamic> updateMark(String mark) async {
    var details = await getDtails();
    var id = await details["id"];
    var body = {"r_id": id, "mark": mark};
    var response =
        await post(Uri.parse("${url}add_LLC_status.php"), body: body);
    if (response.statusCode == 200) {
      var rbody = jsonDecode(response.body);

      if (rbody["message"] == "update") {
        return true;
      }
    }
  }



  static Future<dynamic> notification()async{
    var details = await getDtails();
    var id = await details["id"];
    var body = {"r_id": id,};
    var response =
    await post(Uri.parse("${url}view_notification.php"), body: body);

    if(response.statusCode ==200){
      var rbody = jsonDecode(response.body);
      print(rbody);

      if (rbody[0]["message"] == "sucess") {
        return rbody;
      }
    }
  }
}
