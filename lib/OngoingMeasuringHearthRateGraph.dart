import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(OngoingMeasuringHearthRateGraph());
}

class OngoingMeasuringHearthRateGraph extends StatefulWidget {
  const OngoingMeasuringHearthRateGraph({super.key});
  @override
  _OngoingMeasuringHearthRateGraphScreen createState() => _OngoingMeasuringHearthRateGraphScreen();
}

class _OngoingMeasuringHearthRateGraphScreen extends  State<OngoingMeasuringHearthRateGraph> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:
        Container(
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 90),

        Align(
          alignment: Alignment.centerRight,
          child:
              Row(
                children: [
                  SvgPicture.asset('assets/images/battery.svg'),
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
              )
        ),
        SizedBox(height: 16),
        Image.asset('assets/images/graph1.png'),
        SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Stack(
          children: [
            Align(alignment: Alignment.center, child: Icon(Icons.fiber_manual_record_outlined, size: 39, color: Color(0xffFF6161),)),
           

           Container(margin: EdgeInsets.only(top: 7, left: 7),alignment: Alignment.center, child: Icon(Icons.fiber_manual_record, color: Color(0xffFF6161),)),

          ],
        )   ,
          SizedBox(width: 5,),
            Text('00:03', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
        SizedBox(height: 10,),
        Text('Hold the device for 30s', style: TextStyle(fontSize: 16))

      ],
    ),
    ))));
  }
}