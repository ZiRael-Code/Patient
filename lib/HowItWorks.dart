import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Appointments/AppointmentPaymentSummary.dart';

void main(){
  runApp(HowItWorks());
}

class HowItWorks extends StatefulWidget {
  const HowItWorks({super.key});
  @override
  HowItWorksState createState() => HowItWorksState();
}

class HowItWorksState extends  State<HowItWorks> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'How It Work',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              how(
                text: "How to take vital readings with your device",
              ),

              how(
                text: "How to book an appointment",
              ),

              how(
                text: "How to take vital readings with your device",
              ),

              how(
                text: "How to become an interpreter for others",
              ),

              how(
                text: "How to book an appointment",
              ),

              how(
                text: "How to become an interpreter for others",
              ),

          ]
            ),


    )));
  }

  how({
    required String text
  }) {
    return Column(children: [
      Row(children: [
      Container(
        width: 240,
        child: Text(text, style: TextStyle(
          fontSize: 16,
        ),),
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios_rounded),
    ],),
      SizedBox(height: 12,),
      SvgPicture.asset("assets/images/line.svg"),
      SizedBox(height: 20)
    ]
    );
  }
}