import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(){
  runApp(QuickCheckup());
}

class QuickCheckup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
            title: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: SvgPicture.asset('assets/images/back.svg',
                    width: 8.0,
                    height: 15,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35),
                  alignment: Alignment.center,
                  child:
                Text(
                  'Take a quick checkup',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal
                  ),
                ),

                ),

              ],
            )
        ),
        backgroundColor: Colors.white,
        body: QuickCheckupState(),
      ),
    );
  }
}

class QuickCheckupState extends StatelessWidget{
  const QuickCheckupState({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(height: 50,),

          SizedBox(height: 30,),
        Container(
          width: 228,
          alignment: Alignment.center,
          child: Text(
            'You can take a quick medical checkup with your specialist.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),

      SizedBox(height: 20,),


      Container(
        height: 96,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child:
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/doc.png"),
              ),
              ),
              SizedBox(width: 10), // Add some space between the icon and the text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Muiz Sanni",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Cardiologist surgeon . Freelance specialist"),
                  ],
                ),
            ],
          ),
        ),
      ),
      ],
      ),
    );
  }
}