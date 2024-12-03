
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MeasureHearthRate());
}

class MeasureHearthRate extends StatelessWidget {
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
                    'Measure hearth rate',
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
        body: MeasureHearthRateState(),
    );
  }
}

class MeasureHearthRateState extends StatelessWidget{
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
       Container(
         width: MediaQuery.of(context).size.width * 0.75,
         child:
       Text("Touch the electrodes in one of the ways shown in the pictures above."),
       ),],),
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
             'History',
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
            date: "Today . 12:00 am",
            text: "Regular ECG",
            stackColor:  Color(0xFF1BE43B)
        ),
        history(
        date: "14 Jul 2022 . 12:00 am",
        text: "Irregular ECG",
        stackColor:  Color(0xFFFAB400)
    ),
      history(
        date: "14 Jul 2022 . 12:00 am",
        text: "Abnormal ECG",
        stackColor:  Color(0xFFFF6161)
    ),
       SizedBox(height: 10,),
    ]),)
    ),

     ],) 
   );
  }

 history({
    required text,
    required date,
    required stackColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only( right: 10),
      child: Row(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child:
              SvgPicture.asset("assets/images/irr.svg", fit: BoxFit.fitHeight, color: stackColor,)
          ),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: Colors.black,
                  ),
                ),




              ],),

          )],
      ),
    );
  }


}