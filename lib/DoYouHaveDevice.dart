import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Login.dart';
import 'package:flutter_app/WhatTypeDevice.dart';
import 'package:flutter_svg/svg.dart';

import 'OrderForADevice.dart';

void main(){
  runApp(DoYouHaveDevice());
}

class DoYouHaveDevice extends StatefulWidget{
  @override
  _DoYouHaveDevice createState() => _DoYouHaveDevice();
}

class  _DoYouHaveDevice extends State<DoYouHaveDevice>{
  List<bool> selectedList = [];

  @override
  void initState() {
    super.initState();
    selectedList = List.generate(16, (index) => false);  // Fills the list with 10 false values
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(padding:
       EdgeInsets.only(top: 45, bottom: 30),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(height: 65,),

           Container(
             width: 234,
             child: Text(textAlign: TextAlign.center,'Do you have a device? ',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
           ),
           SizedBox(height: 15,),
           Container(
             width: 284,
             child: Text(textAlign: TextAlign.center,'From your condition(s), there are devices that are essential for measuring your vitals to ensure proper health monitoring.',style: TextStyle(fontSize: 14,),),
           ),
           SizedBox(height: 45,),
           Container(
             alignment: Alignment.center,
             child: Stack(
               children: [
               Align(
               alignment: Alignment.center,
                child:  SvgPicture.asset('assets/images/1blob.svg',
                ),
               ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/images/dev.svg',
                    width: 204,
                    height: 132,
                  ),
                )
                 ,
               ],
             ),
           ),
           Spacer(),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               InkWell(
                 onTap: ()=>{
                 Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> WhatTypeDevice()))
                 },
                 child:
               button(
                 icon: Icons.check,
                 text: "I have a device"
               ),
               ),
               GestureDetector(
                 child:
               button(
                 icon: Icons.block,
                 text: "I don’t have a device"
               ),
                   onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> OrderForADevice()))

               ),
               GestureDetector(
                 child:
               button(
                 icon: Icons.access_time_rounded,
                 text: "I’ll get it later"
               ),
                 onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Login()))
               ),
             ]
           ),
           SizedBox(height: 25,)
         ],
       ),
       ),
   );
  }

  button({
    required icon,
    required String text
  }) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 81,
            height: 81,
            decoration: BoxDecoration(
              color: Color(0xffE2EDFF),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, size: 55, weight: 4, color: Colors.blue,),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            width: 71,
            child: Text(text, textAlign: TextAlign.center,),
          )
          
        ],
      )
    );
  }

}