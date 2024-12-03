import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(IrregularECGGraphComplete());
}

class IrregularECGGraphComplete extends StatefulWidget {
  const IrregularECGGraphComplete({super.key});
  @override
  _IrregularECGGraphCompleteScreen createState() => _IrregularECGGraphCompleteScreen();
}

class _IrregularECGGraphCompleteScreen extends  State<IrregularECGGraphComplete> {
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
            width: 35,
            height: 35,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5),
            ),
            child: Icon(Icons.share),
            ),

            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child:
        Container(
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
            Align(
              child:
              Column(
                children: [
                  SizedBox(height: 30),
                       Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.black.withOpacity(0.15)),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.only(left: 15),
                                padding: EdgeInsets.all(15),
                                child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              // Spacer(),
                                              Column(
                                                children: [
                                                  Text('107/60', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('SYS/DIA  ', style: TextStyle(fontSize: 10),),
                                                      Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: 10),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffFF618F),
                                            ),
                                            width: 46,
                                            height: 46,
                                            padding: EdgeInsets.all(8),
                                            child: SvgPicture.asset('assets/images/hearth.svg'),
                                          ),

                                        ],
                                      ),
                                      SizedBox(height: 15,),
                                      SvgPicture.asset('assets/images/line.svg'),
                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Icon(Icons.info),
                                          SizedBox(width: 10,),
                                          Text('Irregular ECG'),
                                        ],
                                      )
                                    ]
                                )
                            ),
                            SizedBox(height: 15,),


                          ]
                      ),
                  SizedBox(height: 25,),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Note',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15.0, // Height of 50 (including padding)
                        horizontal: 10.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    Text("Due to the sporadic and transient nature of ECG events,it is normal for each measurement result to be different. It is recommended that you increase the frequency of monitoring and capture incidents in a timely manner."),
                  ),
                  ]
              ),
                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    width: MediaQuery.of(context).size.width * 0.75,
                    child:
                    Text("The results of this analysis are only for reference in daily heart health monitoring, they cannot replace the medical diagnosisEx results, and cannot used for clinical diagnosisEx and treatment."),
                  ),
                  ]
              )

            ]))))));
  }
}