import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureBP());
}

class MeasureBP extends StatefulWidget {
  const MeasureBP({super.key});
  @override
  _MeasureBPScreen createState() => _MeasureBPScreen();
}

class _MeasureBPScreen extends  State<MeasureBP> {
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
                width: 35,
                height: 35,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: Center(child: Icon(Icons.share)),
              ),

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
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.1)
          ),
           child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SYS/DA text at the top
                // Adding some space between the rows

                // Row with main value and container
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Main value (107/60)
                      Text(
                        '107/60',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // Container with background and icon
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFFA64FFE),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,  // Replace with your preferred icon
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  Row(children: [
                    Text(
                      'SYS/DA',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 9,),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],),
                ],),

                SizedBox(height: 20),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: 20),

                Row(
                  children: [
                reading(
                    header: 'Pulse rate',
                    value: "83",
                    script: "/min"
                ),
                    SizedBox(width: 15), // Spacer between the columns

                    // Column 2: Additional value with subscript
                    reading(
                        header: 'MAP',
                        value: "91",
                        script: "/mmHg"
                    ),


                SizedBox(width: 60), // Space before the next element

                    reading(
                      header: 'Blood Pressure',
                      value: "48",
                      script: "/mmHg"
                    ),
              ],

            )
              ],
           ),

        ),
        SizedBox(height: 20,),
        SvgPicture.asset('assets/images/readingchat.svg'),
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Note',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey.withOpacity(0.2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey, width: 1), // Border properties
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blue, width: 2), // Focused border color
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.transparent, width: 1), // Enabled border color
              ),
            ),
          ),
        )


      ],
    ),
    ))));
  }

  reading({required String header,
    required String value,
    required String script}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header, // Label
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value, // Main value (e.g., 48)
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(1, 4),
                      child: Text(
                        script, // Subscript text
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}