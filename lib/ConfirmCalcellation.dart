import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(ConfirmCalcellation());
}

class ConfirmCalcellation extends StatefulWidget {
  const ConfirmCalcellation({super.key});
  @override
  _ConfirmCalcellationScreen createState() => _ConfirmCalcellationScreen();
}

class _ConfirmCalcellationScreen extends  State<ConfirmCalcellation> {
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
                child:
                Center(child: Text(
                  'Success!',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 70),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.48,
          child:
        Align(child: Text("Your money will be refunded to within 24hours", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),
          SizedBox(height: 40),

          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              border: Border.all(width: 1, color: Colors.black.withOpacity(0.05))
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 5,
                decoration: BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.circular(50)
                ),
              ),
          SizedBox(height: 25,),
          Align(child: Text("Appointment information", textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          ),
      SizedBox(height: 45,),
      //
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(
                  children: [
                    Image.asset('assets/images/dr_profile.png',
                      width: 56,
                      height: 56,
                    ),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text("Dr. Muiz Sanni", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
                        SizedBox(height: 5,),
                        Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color:  Colors.black.withOpacity(0.1)),
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: 150,
                height: 56,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center( child: Text("FEE: ", style: TextStyle(fontSize: 16,color: Colors.black),),),Center( child: Text("N25,000", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),),),]),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color:  Colors.black.withOpacity(0.1)),
                ),
              ),
              SizedBox(height: 20,),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Text("Time:"),
                      Spacer(),
                      Text("12:00pm"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text("Date:"),
                      Spacer(),
                      Text("12th July 2022"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text("Appointment type:"),
                      Spacer(),
                      Text("Online"),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text("Consultation fee:"),
                      Spacer(),
                      Text("N25,000.00"),
                    ],
                  ),
                ],
              ),
      //             //
              SizedBox(height: 50),
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
                    'Confirm cancellation',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

            ]
          )
          )

      ],
    ),
    ))));
  }
}