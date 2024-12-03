import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppointmentPaymentSummary.dart';

void main(){
  runApp(Otp());
}

class Otp extends StatefulWidget {
  const Otp({super.key});
  @override
  OtpState createState() => OtpState();
}

class OtpState extends  State<Otp> {
  String? _selectedValue;
  List<String> otp = List.filled(6, ""); // List to hold OTP digits
  List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());

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
                  'PIN Settings',
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
          width: MediaQuery.of(context).size.width * 0.58,
          child:
        Align(child: Text("A 6 - digit OTP code has been sent to your phone. Type it in the field below", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),

        SizedBox(height: 35,),

        Align(
        alignment: Alignment.centerLeft,
        child:
          Text("OTP",
          style: TextStyle(fontSize: 14),),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              return Container(
                width: 50,
                height: 66,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffe2e2e2)),
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  obscureText: true, // Mask input
                  obscuringCharacter: '*', // Display input as '*'
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.top, // Align text at the top
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    counterText: "", // Hide character counter
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      otp[index] = value;
                    });

                    if (value.isNotEmpty && index < 5) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              );
            }),
          ),
          SizedBox(height: 30,),
          Text("Resend OTP",
            style: TextStyle(fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.blue),),
      ],
    ),
    ))));
  }
}
