import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/SelectCondition.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(SetupComplete());
}

class SetupComplete extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(

        ),
        body: Padding(
            padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25,),
              Text('Success!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),)
              ,
              SizedBox(height: 15,),
              Container(
                width: 226,
                child: Text(textAlign: TextAlign.center, 'You’ve setup the basics for your account. Click continue to tailor the app experience to you.', style: TextStyle(fontSize: 14),),
              ),
              Spacer(),
              SvgPicture.asset('assets/images/woman.svg'),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SelectCondition()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Login()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                    side: BorderSide(width: 1, color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    textStyle: TextStyle(color: Colors.blue)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Login to app instead',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 25,)

            ]
        ),
        ),
    );
  }
}