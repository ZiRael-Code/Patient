import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_app/Medication/OrderDeatils.dart';
import 'package:flutter_app/QuickCheckup.dart';
import 'package:flutter_app/Medication/RenewOrderSummary.dart';
import 'package:flutter_app/Medication/TakeAQuickCheckup.dart';
import 'package:flutter_svg/svg.dart';

import 'MedicationUsageConfirmation.dart';

void main(){
  runApp(NoMedication());
}

class NoMedication extends StatefulWidget {
  const NoMedication({super.key});
  @override
  _NoMedicationScreen createState() => _NoMedicationScreen();
}

class _NoMedicationScreen extends  State<NoMedication> {
  String? _selectedValue;
  late List<dynamic> sectionList = [orderNewDrugSection(), takeAQuickCheckupSection(), viewOrderSection()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                Text(
                      'Medication',
                      style: TextStyle(
                        color: Color(0xFF2E2E42),
                        fontSize: 26, // Font size
                        fontWeight: FontWeight.bold, // Bold text
                      ),
                    ),
                  Spacer(),
                  Row(
                    children: [
                       SvgPicture.asset('assets/images/eletric.svg'),
                      SizedBox(width: 11,),
                      Stack(
                        children: [
                          SvgPicture.asset('assets/images/nots.svg'),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Notifications()));
                              },
                              child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Color(0xffE40404),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 2, color: Colors.white),
                              ),
                            ),
                            ),
                          ),
                        ],
                      )

                    ],
                  )


                ],
              ),
              centerTitle: true,
            ),
            body: Padding(padding: EdgeInsets.all(20),
            child: Column(
              children: [
                randomMedicationChooser(),
                SizedBox(height: 40,),

                Row(
                  children: [
                  Text('History', style: TextStyle(
                  color: Color(0xFF2E2E42),
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.bold, // Bold text
                ),
                  ),
                    Spacer(),

                    Text('See all', style: TextStyle(
                      color: Color(0xFF2E2E42),
                      fontSize: 12,
                    ),),
                  ],
                ),
                SizedBox(height: 20,),

                // noHistory(),
                Expanded(child: SingleChildScrollView(
                    child:
                Column(
                  children: [
                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                    history(
                        des: "Prescription by Dr. Chima",
                        date: '11th June - 11 July 2022'
                    ),

                  ],
                )
                )
                )



              ],
            ),
            )
        )
    );
  }

   randomMedicationChooser(){
    return sectionList[Random.secure().nextInt(3)];
  }

  viewOrderSection(){
    return  Column(
        children: [
          SizedBox(height: 40,),
          SvgPicture.asset('assets/images/bikeman.svg'),
          SizedBox(height: 20,),
          Container(
            width: 292,
            child: Text('Your order for new medications is processing. You will be notified when it’s ready.'),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: 242,
            child:  ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDeatils()));
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
                  'Order new medications',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ]
    );
  }

  orderNewDrugSection(){
    return Column(
        children: [
          SizedBox(height: 40,),
          SvgPicture.asset('assets/images/drugs.svg'),
          SizedBox(height: 20,),
          Text('You prescriptions have been exhausted'),
          SizedBox(height: 20,),
          SizedBox(
            // width: 242,
            child:  ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RenewOrderSummary()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                child: Text(
                  'Order new medications',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ]
    );
  }

  takeAQuickCheckupSection() {
    return  DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 342,
        height: 298,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset('assets/images/box.svg'),
            SizedBox(height: 20,),
            Container(
              width: 241,
              child:
            Text(textAlign: TextAlign.center,'You don’t have any medications as of now. Tap the button below for a quick session with a doctor/hospital/pharmacy.', style: TextStyle(fontSize: 14.5,
                color: Colors.black.withOpacity(0.40)),),),
            SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to MedicationUsageConfirmation Screen
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TakeAQuickCheckup()));
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
                    'Take a quick checkup  ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            Spacer(),

          ],
        ),


      ),
    );
  }

  noHistory() {
    return Column(children: [
      SizedBox(height: 30,),
      // Spacer(),
      DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 342,
        height: 146,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No medication history yet.', style: TextStyle(fontSize: 16,
                color: Colors.black.withOpacity(0.40)),),
            ],
        ),


      ),
    ),
      // Spacer(),
    ]
    );
  }

  history({required String des,
    required String date}) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> MedicationUsageConfirmation()));
      },
        child: Container(
      padding: EdgeInsets.only(left: 14,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(des, style: TextStyle(fontSize: 18, color: Colors.black)),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE2EDFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                child: Text('View details', style: TextStyle(fontSize: 10, color: Colors.blue)),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(date),
          SizedBox(height: 20),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 20),
        ],
      ),
      ),
    );
  }
}