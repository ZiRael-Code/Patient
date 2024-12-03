
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MeasureBloodPresure());
}

class MeasureBloodPresure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: Icon(Icons.arrow_back_ios_new_rounded, ),
                    // color: Colors.black,
                    // width: 8.0,
                    // height: 15,),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35),
                  alignment: Alignment.center,
                  child:
                  Center(child: Text(
                    'Measure blood presure',
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.normal
                    ),
                  ),
                  ),
                ),
              ],
            )
        ),
        backgroundColor: Colors.white,
        body: MeasureBloodPresureState(),
    );
  }
}

class MeasureBloodPresureState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.all(12),
     child: Column(children: [
     Container(
     width: double.infinity,
     height: 150,

     decoration: BoxDecoration(
       color: Color(0xFFF2F2F2),
       borderRadius: BorderRadius.circular(15)),
   ),
   SizedBox(height: 20,),
       Row(children: [
       Container(
         width: 20,
         height: 20,
         margin: EdgeInsets.only(right: 7),
         child: Center(child: Text('1', style: TextStyle(color: Color(
             0xFF2E2E42)),),),
         decoration: BoxDecoration(
           color: Color(0xFFF2F2F2).withOpacity(0.5),
           shape: BoxShape.circle
         ),

       ),
       Text("Wear the device properly."),
       ],),
       SizedBox(height: 10,),

       Row(children: [
       Container(
         width: 20,
         height: 20,
         margin: EdgeInsets.only(right: 7),
         child: Center(child: Text('2', style: TextStyle(color: Color(
             0xFF2E2E42)),),),
         decoration: BoxDecoration(
             color: Color(0xFFF2F2F2).withOpacity(0.5),
           shape: BoxShape.circle
         ),
       ),
       Container(
           width: MediaQuery.of(context).size.width * 0.63,
           child: 
       Text("Click Start/Stop button on the device to start measuring.", ),
           )
       ],),
      SizedBox(height: 20,),

       Row(
         children: [
           Text(""),
           Text(""),
         ],
       ),
       SizedBox(height: 15,),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(
             'Readings History',
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 19,
             ),
           ),
           TextButton(
             onPressed: () {},
             style: TextButton.styleFrom(
               padding: EdgeInsets.zero,
               minimumSize: Size(0, 0),
             ),
             child: Text(
               'See all',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Colors.blue,
               ),
             ),
           ),
         ],
       ),
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(child: Column(
          children: [
    history(
       mmhg: "107/60",
         bpm: "67",
         date: "Today, 12:00 am",
           bulletColor: Colors.lightGreenAccent
       ),
    SizedBox(height: 10,),
       history(
       mmhg: "125/60",
         bpm: "88",
         date: "14 Jul 2022. 12:00 am",
        bulletColor: Color(0xFFFAB400)
       ),

       SizedBox(height: 10,),
       history(
       mmhg: "107/60",
         bpm: "67",
         date: "20 Apr 2022. 10:14 am",
        bulletColor: Color(0xFFFF6161)
       ),
    ]),)
    ),

     ],) 
   );
  }

  history({
  required mmhg,
    required bpm,
    required date,
    required bulletColor,
  }){
    return Container(
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 28),
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: bulletColor, // Lemon green color
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 16), // Space between the circle and the texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      mmhg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      bpm,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'BPM',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: Colors.black,
          ),
        ],
      ),
    );


  }

  }