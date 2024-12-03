import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(UnableToAnalyseMessage());
}

class UnableToAnalyseMessage extends StatefulWidget {
  const UnableToAnalyseMessage({super.key});
  @override
  _UnableToAnalyseMessageScreen createState() => _UnableToAnalyseMessageScreen();
}

class _UnableToAnalyseMessageScreen extends  State<UnableToAnalyseMessage> {
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
        SvgPicture.asset('assets/images/battery.svg'),
        ),
        SizedBox(height: 35,),
        SvgPicture.asset('assets/images/bulb.svg'),
        SizedBox(height: 35,),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          child: Text('Measurement not completed, Unable to analyse', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
        ),
         SizedBox(height: 10,),
        Text('(minimum continuous measurement for 30s)'),
        SizedBox(height: 90,),

        Container(
          width: MediaQuery.of(context).size.width * 0.54,
          child: Text(textAlign: TextAlign.center, '*press START/STOP button to start or stop measuring'),
        )
      ],
    ),
    ))));
  }
}