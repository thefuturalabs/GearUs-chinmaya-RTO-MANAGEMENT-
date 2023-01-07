import 'package:flutter/material.dart';
import 'package:gearus_app/uitilites/appconstant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var MediaQ = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppConstants.backgroundColors,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "GearUs",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
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
                  "Sourav",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("Souravkk@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "A",
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
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => EditProfileScreen(),
                  // ));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Feedback"),
                trailing: Icon(Icons.feedback),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => FeedbackScreen(),
                  // ));
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
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: AppConstants.backgroundColors, width: 3)),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQ.height / 13,
                        width: MediaQ.width / 2.7,
                        child: Center(
                          child: Text(
                            "Upload Document",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: AppConstants.backgroundColors,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        height: MediaQ.height / 13,
                        width: MediaQ.width / 2.7,
                        child: Center(
                          child: Text(
                            "Apply LLR",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: AppConstants.backgroundColors,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: MediaQ.height / 13,
                        width: MediaQ.width / 2.7,
                        child: Center(
                          child: Text(
                            "Apply License",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: AppConstants.backgroundColors,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        height: MediaQ.height / 13,
                        width: MediaQ.width / 2.7,
                        child: Center(
                          child: Text(
                            "Renewal License",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: AppConstants.backgroundColors,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
