import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/ScheduledAppointment.dart';
import 'package:flutter_svg/svg.dart';

import '../MainManvigator.dart';


void main(){
  runApp(CancelSuccess());
}

class CancelSuccess extends StatefulWidget {
  const CancelSuccess({super.key});
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends  State<CancelSuccess> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  'Success!',
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
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("You have successfully cancelled an appointment. You will be notified once you have been refunded.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),

        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> ScheduledAppointment()));
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
              'Back to appointments page',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}