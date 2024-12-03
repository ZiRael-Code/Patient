
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(BookAppointment());
}

class BookAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookAppointmentState(),
    );
  }
}

class BookAppointmentState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Container(
            margin: EdgeInsets.only(left: 35),
            alignment: Alignment.center,
            child:
            Text(
              'Book appointment',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal
              ),
            ),

          ),

        ],
      )
      )
    );

  }
}

class BookAppointmentStateScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),

        ],
      ),
    );
  }
}