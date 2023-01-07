import 'package:flutter/material.dart';

class Register_as extends StatelessWidget {
  const Register_as({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("Register as"),
        ),
        body:
        Center(
          child: Column(
            children: [
              SizedBox(height: 300,),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) =>
                  // ));
                },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                    child: Text("Customer")
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => Driver_reg()
                  // ));
                },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )
                      ),
                    ),
                    child: Text("Driver")
                ),
              ),

            ],
          ),
        )
    );
  }
}