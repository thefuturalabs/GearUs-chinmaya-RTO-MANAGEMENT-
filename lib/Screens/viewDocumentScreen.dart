import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:image_downloader/image_downloader.dart';

import '../uitilites/appconstant.dart';

class ViewDocumentScreen extends StatefulWidget {
  const ViewDocumentScreen({Key? key}) : super(key: key);

  @override
  State<ViewDocumentScreen> createState() => _ViewDocumentScreenState();
}

class _ViewDocumentScreenState extends State<ViewDocumentScreen> {

var file;
  downloadingImage(String url)async{

    FileDownloader.downloadFile(
        url: url,
        name: "PANDA",
        onDownloadCompleted: (path) {
           file = File(path);
           print(path);
           print("sdfghjkl");
          //This will be the path of the downloaded file
          setState(() {

          });
        });
    // try {
      // Saved with this method.
      // var imageId = await ImageDownloader.downloadImage("http://192.168.29.86/Gearus-chinmaya/image1/1.jpg");
      // print(imageId);
    //   if (imageId == null) {
    //     return;
    //   }
    //
    //   // Below is a method of obtaining saved image information.
    //   var fileName = await ImageDownloader.findName(imageId);
    //    path = await ImageDownloader.findPath(imageId);
    //   var size = await ImageDownloader.findByteSize(imageId);
    //   var mimeType = await ImageDownloader.findMimeType(imageId);
    //
    //
    // } on PlatformException catch (error) {
    //   print("  image downloading error ${error}");
    // }
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Document",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppConstants.backgroundColors),
                  textAlign: TextAlign.center,
                ),
              ),
              FutureBuilder(
                  future: Services.viewLLC(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppConstants.backgroundColors,
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: AppConstants.backgroundColors,
                            elevation: 2,

                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                border: Border.all(color: AppConstants.backgroundColors)
                              ),

                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              "${Services.url.split("API").first}image1/${snapshot.data["photo"]}"),
                                        ),
                                        border: Border.all(
                                            color: AppConstants.backgroundColors,
                                            width: 2)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0,top:8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["first_name"]} ${snapshot.data["last_name"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["email"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Date of birth :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["DOB"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "State :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["state"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "City :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["city"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Birth place :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["Birth_place"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Blood group :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["Blood_group"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "LLC type :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["LLC_type"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Qualification :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "${snapshot.data["qualification"]}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "LLC status :  ",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        snapshot.data["status"] == "TEM approve"
                                            ? Text(
                                                "Waiting for RTO Approval",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),
                                              )
                                            : snapshot.data["status"] == "Issue"
                                                ? Text(
                                                    "Approved",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                :snapshot.data["status"] == "register"
                                            ? Text(
                                          "Not attentend the test",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight:
                                              FontWeight.w400),
                                        )
                                            : Text(
                                                    "Pending",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(onPressed: (){
                                    downloadingImage( "${Services.url.split("API").first}image1/${snapshot.data["photo"]}");
                                  }, child: Text("click")),


                                 file != null ? Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.file(file),
                                  ):Text("df"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text("No document"),
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
