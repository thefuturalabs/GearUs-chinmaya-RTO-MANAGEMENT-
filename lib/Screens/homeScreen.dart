import 'package:flutter/material.dart';
import 'package:gearus_app/Screens/loginScreen.dart';
import 'package:gearus_app/Screens/profileScreen.dart';
import 'package:gearus_app/Screens/quizStartingScreen.dart';
import 'package:gearus_app/Screens/renewalScreen.dart';
import 'package:gearus_app/Screens/viewDocumentScreen.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:gearus_app/uitilites/appconstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'applyScreen1.dart';
import 'feedbackScreen.dart';
import 'notificationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   // the new route
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //         HomeScreen(),
                      //   ),
                      //
                      //       (Route route) => false,
                      // );
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

  applyOrRenewal() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Apply for"),
          content: Container(
            height: 100,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ApplyScreen1(),
                    ));
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
                        "LLR & License",
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RenewalScreen(),
                    ));
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
                        "Renewal",
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

  Map userDeatils = {"name": "", "id": "", "email": ""};
  String fnamelatter = " ";

  bool applyedforLCC = false;
  var name;
  var email;
  var status;
  var licence_status;

  getstatus() async {
    status = await Services.viewLLC();
    setState(() {});
  }

  getDetails() async {
    var d = await Services.getDtails();
    await getstatus();
    await Services.viewLLC();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name = await sharedPreferences.getString("name") ?? "";
    email = await sharedPreferences.getString("email") ?? "";
    licence_status = await sharedPreferences.getString("licence_status") ?? "";
    print(" listus status${licence_status}");
    setState(() {});
    setState(() {
      userDeatils = d;
    });
    if (d["applyforllc"] == "register") {
      setState(() {
        applyedforLCC = true;
      });
    }

    setState(() {
      userDeatils = d;
      print(userDeatils);
      if (d["name"]!.length >= 3) {
        print("yess");
        fnamelatter = d["name"].substring(0, 1).toString();
      } else {
        fnamelatter = "";
      }
    });

    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var MediaQ = MediaQuery.of(context).size;


    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppConstants.backgroundColors,
        onPressed: () async {
          var details = await Services.viewLLC();

          print("button  ${details}");

          if(details == null){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ApplyScreen1(),
            ));
          }
          if (details["status"] == "register") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => QuizStartingScreen(),
            ));
          } else if (details["status"] == "TEM approve") {
            messages();
          } else if (details["status"] == "Issue" ) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ViewDocumentScreen(),
            ));
          } else if (userDeatils["licence_status"] == "Yes") {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RenewalScreen(),
            ));

          }else if(details["status"] == "licence issue" ){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RenewalScreen(),
            ));
          }else{
            applyOrRenewal();
          }
        },
        label:status == null ?  Text(
          "Apply",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ): status["status"] == "register"
            ? Text(
                "Apply",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            :status["status"] == "Issue"
            ? Text(
                "See LLC",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ): status["status"] == "licence issue"
            ? Text(
          "See Licence",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ):Text(
          "Apply",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppConstants.backgroundColors,
        // automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        // foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "GearUs",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppConstants.backgroundColors,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: AppConstants.backgroundColors),
                accountName: Text(
                  name ?? "loading..",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(email ?? "loading.."),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    fnamelatter!.toUpperCase(),
                    style: TextStyle(
                        fontSize: 30.0, color: AppConstants.backgroundColors),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
            Card(
              child: ListTile(
                title: Text("profile"),
                trailing: Icon(Icons.account_circle),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Renewal"),
                trailing: Icon(Icons.autorenew),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RenewalScreen(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("View documents"),
                trailing: Icon(Icons.document_scanner),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewDocumentScreen(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Feedback"),
                trailing: Icon(Icons.feedback),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FeedBackScreen(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Notification"),
                trailing: Icon(Icons.notifications),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () async {
                  SharedPreferences sharefp =
                      await SharedPreferences.getInstance();
                  await sharefp.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                    // the new route
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ),

                    (Route route) => false,
                  );
                  //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings(),));
                },
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQ.width,
                height: MediaQ.height / 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      userDeatils["licence_status"] == "Yes"?Text(
                        "Apply for  renewal license",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ):status == null
                    ? Text(
                    "You haven't apply for Driving license ",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ):
                  status["status"] == "register"
                          ? Text(
                              "You have applied for LLC",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            )
                          : status["status"] == "TEM approve"
                              ? Text(
                                  "You have applied for LLC",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )
                              : status["status"] == "Issue"
                                  ? Text(
                                      "Your LLC Approved",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    )
                      : status["status"] == "licence issue"
                      ? Text(
                    "Your License Approved",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  )
                                   :Text(
                                      "You haven't apply for Driving license ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),

                      ///---------------------------------------------
                      userDeatils["licence_status"] == "Yes"? Text(
                        "Click below to apply ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ): status == null
                          ? Text(
                        "Click below to apply ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ):   status["status"] == "register"
                          ? Text(
                              "Click below to Start the test",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            )
                          : status["status"] == "TEM approve"
                              ? Text(
                                  "Wait for Approval",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                )
                              : status["status"] == "Issue"
                                  ? Text(
                                      "Click below to see LLC",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ): status["status"] == "licence issue"
                          ? Text(
                        "Click below to Renewa your License",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      )
                                  : Text(
                                      "Click below to apply",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: AppConstants.backgroundColors, width: 3)),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/homepage.jpg"),
                fit: BoxFit.contain,
              )),
            ))
          ],
        ),
      ),
    );
  }
}
