import 'package:flutter/material.dart';
import 'package:gearus_app/Screens/profileScreen.dart';
import 'package:gearus_app/Screens/renewalScreen.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:gearus_app/uitilites/appconstant.dart';

import 'applyScreen1.dart';
import 'feedbackScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      builder: (context) =>  RenewalScreen(),
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


  Map userDeatils={"name":"","id":"","email":""};
  String fnamelatter=" ";

  getDetails()async{
    var d = await Services.getDtails();
    setState(() {
      userDeatils = d;
      if (userDeatils!["name"]!.length >= 3) {
        fnamelatter =userDeatils!["name"].substring(0, 1).toString();
      } else {
        fnamelatter = "";
      }

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
        onPressed: () {
          applyOrRenewal();
        },
        label: Text(
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
                  userDeatils["name"] ?? "",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(userDeatils["email"] ?? ""),
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
                    builder: (context) =>  RenewalScreen(),
                  ));
                },
              ),
            ),

            Card(
              child: ListTile(
                title: Text("View documents"),
                trailing: Icon(Icons.document_scanner),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) =>  RenewalScreen(),
                  // ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Feedback"),
                trailing: Icon(Icons.feedback),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  FeedBackScreen(),
                  ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.logout),
                onTap: () async {
                  // SharedPreferences sharefp =
                  // await SharedPreferences.getInstance();
                  // await sharefp.clear();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //   // the new route
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => LoginScreen(),
                  //   ),
                  //
                  //       (Route route) => false,
                  // );
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Settings(),));
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
                      Text(
                        "You haven't apply for Driving license",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Click below to Apply",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
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
