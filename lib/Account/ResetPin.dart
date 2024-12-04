import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/PhoneNumberOtp.dart';
import 'package:flutter_app/PinSettings.dart';
import 'package:flutter_svg/svg.dart';

import '../EmailOtp.dart';

class ResetPin extends StatefulWidget {
  const ResetPin({super.key});

  @override
  State<ResetPin> createState() => _ResetPinState();
}

class _ResetPinState extends State<ResetPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Reset PIN',
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
                        Align(child: Text("To reset your PIN, an OTP will be sent to your phone or email", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        ),
                      ),
                      SizedBox(height: 55,),
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  PhoneNumberOtp())),
                    child:
                    OPTION(label: "Phone number",
                          name: "0801 222 3334"),),

                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  EmailOtp())),
                    child:
                      OPTION(label: "Email Address",
                          name: "jonathandoe@gmail.com")),
                    ]
                )
            )
        )
    );
  }

  OPTION({
    required String label,
    required String name,
}){
return Column(
    children: [
      Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.black38),),
        SizedBox(height: 10,),
        Text(name, style: TextStyle(fontSize: 16, color: Colors.black),)
      ],
    ),
    Spacer(),
    Icon(Icons.arrow_forward_ios, color: Colors.blue,),
  ],
      ),
      SizedBox(height: 20,),
      SvgPicture.asset("assets/images/line.svg"),
      SizedBox(height: 25,),
    ],
);
}

}
