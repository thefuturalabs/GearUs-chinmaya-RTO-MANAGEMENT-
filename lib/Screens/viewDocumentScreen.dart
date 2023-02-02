import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:gearus_app/controller/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../uitilites/appconstant.dart';

class ViewDocumentScreen extends StatefulWidget {
  const ViewDocumentScreen({Key? key}) : super(key: key);

  @override
  State<ViewDocumentScreen> createState() => _ViewDocumentScreenState();
}

class _ViewDocumentScreenState extends State<ViewDocumentScreen> {

  ScreenshotController screenshotController = ScreenshotController();

var file;


var deatils;
getdata()async{
  deatils = await Services.viewlicense();
  setState(() {

  });
 print("approved ==${deatils}");
}
  // downloadingImage(String url)async{
  //
  //   FileDownloader.downloadFile(
  //       url: url,
  //       name: "PANDA",
  //       onDownloadCompleted: (path) {
  //          file = File(path);
  //          print(path);
  //          print("sdfghjkl");
  //         //This will be the path of the downloaded file
  //         setState(() {
  //
  //         });
  //       });
  //   // try {
  //     // Saved with this method.
  //     // var imageId = await ImageDownloader.downloadImage("http://192.168.29.86/Gearus-chinmaya/image1/1.jpg");
  //     // print(imageId);
  //   //   if (imageId == null) {
  //   //     return;
  //   //   }
  //   //
  //   //   // Below is a method of obtaining saved image information.
  //   //   var fileName = await ImageDownloader.findName(imageId);
  //   //    path = await ImageDownloader.findPath(imageId);
  //   //   var size = await ImageDownloader.findByteSize(imageId);
  //   //   var mimeType = await ImageDownloader.findMimeType(imageId);
  //   //
  //   //
  //   // } on PlatformException catch (error) {
  //   //   print("  image downloading error ${error}");
  //   // }
  // }

@override
  void initState() {
    // TODO: implement initState
  getdata();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton:  Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0,left: 25),
          child: InkWell(
            onTap: () async {


              await screenshotController.capture(delay: const Duration(milliseconds: 10)).then(( image) async {
                if (image != null) {
                  EasyLoading.show(status: 'downloading.....', maskType: EasyLoadingMaskType.black,);

                  final directory = await getApplicationDocumentsDirectory();
                  final imagePath = await File('${directory.path}/image.jpg').create();
                  file =   await imagePath.writeAsBytes(image);
                  print("${file!.path}");
                  GallerySaver.saveImage(file!.path,).then((value) {
                    print("downlodddddddddd");
                    EasyLoading.dismiss();
                    if(value == true){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("License Downloaded")));
                    }

                  });

                }
              });

              EasyLoading.dismiss();

              // screenshotController.capture().then(( image) {
              //   //Capture Done
              //   setState(() {
              //     // _imageFile = image;
              //     print(image);
              //
              //
              //  file =   File( 'image.jpg').writeAsBytes(image!);
              //     print(file.path);
              //   });
              // }).catchError((onError) {
              //   print(onError);
              // });

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
                  "Download",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
                        child: SingleChildScrollView(
                          child: Screenshot(
                            controller: screenshotController,
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
                                              "Licence No :  ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "${snapshot.data["l_id"]}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
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
                                            Container(
                                              width: MediaQuery.of(context).size.width/1.65,
                                              height: 50,
                                              child: Text(
                                                "${snapshot.data["LLC_type"]}",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,maxLines: 2,
                                              ),
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
                                            ):snapshot.data["status"] == "licence issue"
                                                ? Text(
                                              "Approved",
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

                                      snapshot.data["status"] == "licence issue"
                                          ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Licence :  ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "Approved",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ):Text(""),

                                      deatils!= null ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "From date :  ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "${deatils["from_date"]}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ):Text(""),

                                      deatils!= null ? Padding(
                                        padding:
                                        const EdgeInsets.only(left: 8.0, top: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "To date :  ",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "${deatils["to_date"]}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ):Text(""),

                                      deatils != null  && deatils["from_date"].isNotEmpty ?  Container(
                                       height: 100,
                                       width: 100,
                                       child: Image.asset("assets/pngegg.png"),
                                     ):Text("")


                                     //  ElevatedButton(onPressed: (){
                                     //    downloadingImage( "${Services.url.split("API").first}image1/${snapshot.data["photo"]}");
                                     //  }, child: Text("click")),
                                     //
                                     //

                                    ],
                                  ),
                                ),
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
