import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(TransactionDetails());
}

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({super.key});
  @override
  _TransactionDetailsScreen createState() => _TransactionDetailsScreen();
}

class _TransactionDetailsScreen extends  State<TransactionDetails> {
  String? _selectedValue;

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
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Appointment details',
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
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
          decoration: BoxDecoration(
            color: Color(0xffE5E5E5),
            borderRadius: BorderRadius.circular(50)
          ),
          child: Text('Appointment', style: TextStyle(fontSize: 16),),
        ),
        SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 103,
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                     child:
                     CircleAvatar(
                          backgroundImage: AssetImage('assets/images/doc.png'),
                          radius: 50
                      ),
                      ),

                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text("Dr. Muiz Sanni", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),)),
                          SizedBox(height: 5,),
                          Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
                        ],
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color:  Colors.black.withOpacity(0.1)),
                  ),
                ),

                SizedBox(height: 45,),

                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time:", style: TextStyle(color: Color(0xFF2E2E42)),),
                          Text("12:00pm",  style: TextStyle(color: Colors.black,fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Spacer(),

                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                            Text("12th July 2022",  style: TextStyle(fontSize: 14,color: Colors.black, fontWeight: FontWeight.bold))
                          ]
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Appointment Type:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                          Text("Online", style: TextStyle(fontSize: 14,color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Spacer(),

                    Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Consultation fee:",  style: TextStyle(color: Color(0xFF2E2E42)),),
                            Text("N20,000",  style: TextStyle(fontSize: 28,color: Colors.blue, fontWeight: FontWeight.bold))
                          ]
                      ),
                    )
                  ],
                ),


              ],
            )

    )])) ));
  }
}