import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceOrderedMessage.dart';
import 'package:flutter_svg/svg.dart';

class DeviceOrderPayment extends StatelessWidget {
  const DeviceOrderPayment({super.key});

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
                  'Payment',
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
      Spacer(),
      Container(
        width: 288,
        child:
      Text(style: TextStyle(fontSize: 16) ,textAlign: TextAlign.center,"This opens up a webpage that leads to paystack where the user can  make payment directly. After the whole process, they are redirected to the app and the flow continues in the next screen.")
      ),
      Spacer(),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => Deviceorderedmessage()));
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

        ]
    )
    )
    )
    );
  }
}
