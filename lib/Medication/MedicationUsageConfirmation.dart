import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_svg/svg.dart';

import 'PrescriptionDetails.dart';

void main(){
  runApp(MedicationUsageConfirmation());
}

class MedicationUsageConfirmation extends StatefulWidget {
  const MedicationUsageConfirmation({super.key});
  @override
  MedicationUsageConfirmationState createState() => MedicationUsageConfirmationState();
}

class MedicationUsageConfirmationState extends  State<MedicationUsageConfirmation> {
  String? _selectedValue;
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(1000, false);
  }

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
                      GestureDetector(
                        onTap: ()=>{
                          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Notifications()))
                        }, child: Stack(
                        children: [
                          SvgPicture.asset('assets/images/nots.svg'),
                          Positioned(
                            top: 0,
                            right: 0, 
                            child:  Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Color(0xffE40404),
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(width: 2, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                      )

                    ],
                  )


                ],
              ),
              centerTitle: true,
            ),
            body: Container(child:
                SingleChildScrollView(
              child:
            Padding(padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
            child:
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 5),
                      width: 105,
                      decoration: BoxDecoration(
                        color: Color(0xFF000000).withOpacity(0.90),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: EdgeInsets.only(left: 14, right: 10),
                      child: DropdownButton<String>(
                        value: _selectedValue,
                        hint: Text(
                          'Select a Time',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedValue = newValue;
                          });
                        },
                        dropdownColor: Color(0xFF000000), // Dark background for dropdown
                        items: <String>['Morning', 'Afternoon', 'Evening', 'Night']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white), // White text for items
                            ),
                          );
                        }).toList(),
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(left: 8, right: 5),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xff2E2E421A),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Text('Total amount of drugs left: ',  style: TextStyle(fontSize: 13,)),
                          Text('80%', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        ]
                      )
                    )
                  ],
                ),
    ),
          Container(
            width: 263,
            margin: EdgeInsets.only(bottom: 20),
            child: Text('Tap here after using your medications to ensure you’ve used them.', style: TextStyle(color: Color(0xff2E2E42)), textAlign: TextAlign.center,)
          ),
                Container(
                  width: 99,
                    height: 99,
                    margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelectedList[0] ? Colors.green : Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:Center(child: SvgPicture.asset('assets/images/mark.svg', color: isSelectedList[0] ? Colors.white : Color(0xffC2C2C2))
                  ),
                  ),
               // Text('data'),

               drug(
                 index: 0,
                 icon: 'assets/images/drug1.svg',
                 name: 'Ibuprofen',
                 dosage: '1 pill(s) . 2x daily'
               ),
                drug(
                    index: 1,
                 icon: 'assets/images/drug2.svg',
                 name: 'Cough Syrup',
                 dosage: '1 pill(s) . 2x daily'
               ),
                drug(
                 index: 2,
                 icon: 'assets/images/drug1.svg',
                 name: 'Ibuprofen',
                 dosage: '1 pill(s) . 2x daily'
               ),
                drug(
                 index: 3,
                 icon: 'assets/images/drug2.svg',
                 name: 'Cough Syrup',
                 dosage: '1 pill(s) . 2x daily'
               ),
                GestureDetector(
                  onTap: ()=>{
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> PrescriptionDetails()))
                },
                  child:
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.only(left: 14, right: 14, bottom: 8, top: 8),
                  child: Text('See more details', style: TextStyle(color: Colors.blue),),
                )
                )
                ],
            ),
            )
        )
        )
        )
    );
  }

  drug({required String icon,
    required String name,
    required String dosage,
    required int index,
  }) {
    return  GestureDetector(

        child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(width: 0.05, color: Colors.black)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.all(10),
            width: 39,
            height: 56,
            decoration: BoxDecoration(
                color: Color(0xff40FB5E).withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Align(alignment: Alignment.topCenter, child: SvgPicture.asset(icon)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Color(0xff2E2E42), fontSize: 20),),
              Text(dosage, style: TextStyle(color: Color(0xff2E2E42))),
            ],
          ),
          Spacer(),
          Container(
            width: 33,
            height: 33,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelectedList[index] ? Colors.green : Color(0xffF2F2F2),
            ),
            child: Icon(Icons.check, color: isSelectedList[index] ? Colors.white : Color(0xffC2C2C2))
          ),
        ],
      ),
    ),
            onTap: () {
          setState(() {
            isSelectedList[index] =!isSelectedList[index];
          });
    },
    );
  }


}