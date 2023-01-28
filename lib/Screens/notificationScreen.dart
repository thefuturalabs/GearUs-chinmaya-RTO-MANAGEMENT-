import 'package:flutter/material.dart';
import 'package:gearus_app/controller/services.dart';

import '../uitilites/appconstant.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Notification",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppConstants.backgroundColors),
                  textAlign: TextAlign.center,
                ),
              ),
              FutureBuilder(
                  future: Services.notification(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(8),
                                width: double.infinity,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data[index]["notification"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                      Text(snapshot.data[index]["attend_date"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20))
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppConstants.backgroundColors,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(8)),
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: Text("No notification"),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
