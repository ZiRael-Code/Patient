import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'LoanDetails.dart';

class Applyforloan extends StatelessWidget {
  const Applyforloan({super.key});

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
      SizedBox(height: 50,),
      Text("Apply for a loan", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
      SizedBox(height: 10,),
      Container(
          width: 256,
          child:
          Text(style: TextStyle(fontSize: 18)
              ,textAlign: TextAlign.center,"You can easily apply for a short loan if you currently don’t have enough money to buy a device.")
      ),
      Spacer(),
      SvgPicture.asset("assets/images/money.svg"),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => LoanDetails()));
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
            'Apply for loan',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),


    ]
    )
    )
    )
    );
  }
}
