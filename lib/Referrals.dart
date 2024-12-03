import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppointmentPaymentSummary.dart';

void main(){
  runApp(Referrals());
}

class Referrals extends StatefulWidget {
  const Referrals({super.key});
  @override
  ReferralsState createState() => ReferralsState();
}

class ReferralsState extends  State<Referrals> {
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
                  'Referrals',
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
          width: MediaQuery.of(context).size.width * 0.68,
          child:
        Align(child: Text("Invite your friends and earn commissions when they buy devices.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),),
        SizedBox(height: 60,),
        SvgPicture.asset('assets/images/pana.svg'),
        SizedBox(height: 40),
        Align(
          alignment: Alignment.center,
          child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          referOption(
              icon: Icon(Icons.person, color: Colors.blue,size: 36,),
              referText: "Refer a regular person"
          ),
          SizedBox(width: 25),
          referOption(
              icon: "assets/images/hospital.svg",
              referText: "Refer a Hospital",
          ),
        ],),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children:  [

          referOption(
              icon: "assets/images/rad.svg",
              referText: "Refer a Doctor"
          ),
          SizedBox(width: 25),
          referOption(
              icon: "assets/images/rap.svg",
              referText: "Refer a Pharmacy"
          ),
        ],)


      ]

      ))
        )));
  }

  referOption({
    icon,
    required String referText
  }) {
    return Column(
      children: [
      Container(
        padding: EdgeInsets.all(25),
      width: 86,
      height: 86,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffE2EDFF)
      ),
      child: icon is Icon ? icon : SvgPicture.asset(icon, width: 26, height: 26,),
    ),
        SizedBox(height: 15,),
        Text(referText, style: TextStyle(
          fontSize: 14
        ),)
    ],
    );
  }
}