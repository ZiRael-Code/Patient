import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Appointments/AppointmentPaymentSummary.dart';

void main(){
  runApp(HowItWorkExplained());
}

class HowItWorkExplained extends StatefulWidget {
  const HowItWorkExplained({super.key});
  @override
  HowItWorkExplainedState createState() => HowItWorkExplainedState();
}

class HowItWorkExplainedState extends  State<HowItWorkExplained> {
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
              Container(
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12),
                 color: Colors.black
                ),
                child: Center(child:  Container(

                  width: 59,
                  height: 59,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05)
                  ),
                  child: Center(child: Icon(Icons.play_arrow, color: Colors.white)),
                ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                  width: 280,
                  child: 
              Text("How to take vital readings with your device", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),)),
              SizedBox(height: 15,),
              Text("""1.) Remove your device from the box and turn it on

2.) Connect it with the app via bluetooth

3.) Touch the sensors as shown above

4.) Wait for about 30seconds - 1 minute and the readings show on your phone. """, style: TextStyle(
                fontSize: 14,
                color: Color(0xff2E2E42)
              ),)
          ]
            ),


    )));
  }

}