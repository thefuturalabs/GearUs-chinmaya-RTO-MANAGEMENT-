import 'package:flutter/material.dart';
import 'package:gearus_app/uitilites/appconstant.dart';

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
  final formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColors,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 150,
              width: 150,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                         // pickimage();
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.edit,
                              color: AppConstants.backgroundColors,
                            )),
                      )),
                ],
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image:
                          NetworkImage(
                              "https://thumbs.dreamstime.com/b/default-avatar-placeholder-profile-icon-male-eps-file-easy-to-edit-default-avatar-placeholder-profile-icon-male-139556753.jpg"),

                      fit: BoxFit.cover),
                  border: Border.all(
                      color: AppConstants.backgroundColors, width: 2)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Form(
                  key: formKey,
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
                      // SizedBox(
                      //   height: 20,
                      // )
                    ],
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
