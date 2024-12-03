import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Signup.dart';
import 'SlideScreen2.dart';

void main(){
  runApp(SlideScreen1());
}

class SlideScreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       body: Padding(padding:
       EdgeInsets.only(top: 45,),
       child: Column(
         children: [
         Align(
         alignment: Alignment.centerRight,
         child: Container(
           padding: EdgeInsets.only(left: 18, right: 18),
           child:InkWell(
             onTap: (){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Signup()));
             },
             child: Text('skip', style: TextStyle(color: Colors.blue, fontSize: 16))),
         ),
         ),
           Align(
             // alignment: Alignment.center,
             child:  SvgPicture.asset(
               'assets/images/bloob2.svg',
               // width: MediaQuery.of(context).size.width,
               // height: MediaQuery.of(context).size.height,
             ),
           ),
           SizedBox(height: 25,),
           SvgPicture.asset('assets/images/slide.svg'),
           SizedBox(height: 25,),
           Container(
             width: 314,
             child: Text('MyVitalz is a mobile application that monitors your health vitals so as to help prevent critical health emergencies.',style: TextStyle(fontSize: 14),),
           ),
           SizedBox(height: 25,),
           Container(
             padding: EdgeInsets.only(left: 18, right: 18),
             child:
           ElevatedButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SlideScreen2()));

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
           ),
         ],
       ),
       ),
   );
  }
}