import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureingHearthGraph());
}

class MeasureingHearthGraph extends StatefulWidget {
  const MeasureingHearthGraph({super.key});
  @override
  _MeasureingHearthGraphScreen createState() => _MeasureingHearthGraphScreen();
}

class _MeasureingHearthGraphScreen extends  State<MeasureingHearthGraph> {
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
                  SizedBox(height: MediaQuery.of(context).size.height*0.05),
                  SvgPicture.asset('assets/images/graph2.svg'),
                  SizedBox(height: MediaQuery.of(context).size.height*0.020),

                  ElevatedButton(
                    onPressed: () {},
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
                        'Back to readings',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ))));
  }
}