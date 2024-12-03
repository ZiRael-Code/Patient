import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureingSquareGraph());
}

class MeasureingSquareGraph extends StatefulWidget {
  const MeasureingSquareGraph({super.key});
  @override
  _MeasureingSquareGraphScreen createState() => _MeasureingSquareGraphScreen();
}

class _MeasureingSquareGraphScreen extends  State<MeasureingSquareGraph> {
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
          padding: EdgeInsets.only(left: 15),
          child: Column(
            children: [
        Row(
          children: [
            Column(
              children: [
                Text('107/60', style: TextStyle(fontSize: 26),),
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
            SizedBox(width: 35,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('67', style: TextStyle(fontSize: 26),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pulse rate  ', style: TextStyle(fontSize: 10),),
                    Text('/min', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: 10),)
                  ],
                )
              ],
            )
          ],
        ),
              SizedBox(height: 15,),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('83', style: TextStyle(fontSize: 18),),
                Row(
                  children: [
                    Text('MAP  ', style: TextStyle(fontSize: 10),),
                    Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: 10),)
                  ],
                )
              ],
            ),
            SizedBox(width: 55,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('64', style: TextStyle(fontSize: 26),),
                Row(
                  children: [
                    Text('Pulse pressure  ', style: TextStyle(fontSize: 10),),
                    Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: 10),)
                  ],
                )
              ],
            )
          ],
        ),
          ]
        )
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.07),
        SvgPicture.asset('assets/images/colorgraph.svg'),
        SizedBox(height: MediaQuery.of(context).size.height*0.032),
        Container(
          width: MediaQuery.of(context).size.width * 0.54,
          child: Text(textAlign: TextAlign.center, '*press START/STOP button to start or stop measuring'),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.12),
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