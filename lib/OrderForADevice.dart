import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/RequestNewDevice.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(OrderForADevice());
}

class OrderForADevice extends StatefulWidget {
  const OrderForADevice({super.key});
  @override
  _OrderForADeviceScreen createState() => _OrderForADeviceScreen();
}

class _OrderForADeviceScreen extends  State<OrderForADevice> {
  String? _selectedValue;

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
          width: 234,
          child: Text(textAlign: TextAlign.center,'Order for a device',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 15,),
        Container(
          width: 284,
          child: Text(textAlign: TextAlign.center,'We have 8 devices for measuring different health vitals. ',style: TextStyle(fontSize: 14,),),
        ),

        Spacer(),
        SvgPicture.asset('assets/images/manydev.svg'),
        Spacer(),

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> RequestNewDevice()));
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
              'Get one now',
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
              'I’ll do this later',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    )));
  }

}