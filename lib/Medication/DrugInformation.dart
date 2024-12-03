import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(DrugInformation());
}

class DrugInformation extends StatefulWidget {
  const DrugInformation({super.key});
  @override
  _DrugInformationScreen createState() => _DrugInformationScreen();
}

class _DrugInformationScreen extends  State<DrugInformation> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    bool isToday = true;
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                ],
              ),
              centerTitle: true,
            ),
            body: Padding(
                padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
                child: Column(
              children: [
                Text('Drug Information', style: TextStyle(fontSize: 18),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text('Drug name:    ', style: TextStyle(color: Color(0xff2E2E42))),
                    Text('Ibuprofen 500mg x 24', style: TextStyle(color: Colors.blue, fontSize: 20),)
                  ],
                ),
                SizedBox(height: 15,),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: 15,),
                Row(
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Drug type:', style: TextStyle(color: Color(0xff666666))),
                    Text('Capsules', style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dosage:', style: TextStyle(color: Color(0xff666666))),
                    Text('2 pills', style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ), ],
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Amount used:', style: TextStyle(color: Color(0xff666666))),
                    Text('5/20', style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total duration:', style: TextStyle(color: Color(0xff666666))),
                    Text('2 weeks', style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Frequency:', style: TextStyle(color: Color(0xff666666))),
                    Text('3X daily [ Morning, Afternoon, Night ]', style: TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),
                ),
                SizedBox(height: 20,),

                Align(
                  alignment: Alignment.centerLeft,
                  child:Text('Commentary:', style: TextStyle(color: Color(0xff666666))),)
                  ,SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: Text('The patient should ensure to use the medications as prescribed and also use the medication after eating. On no occasion should the patient use the medication on an empty stomach.', style: TextStyle(color: Color(0xff666666), fontSize: 16),),
                ),
                SizedBox(height: 25,),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                padding: EdgeInsets.all(14),
                      width: 66,
                      height: 66,
                      decoration: BoxDecoration(
                        color: isToday ? Colors.green : Color(0xffF2F2F2),
                        shape: BoxShape.circle,
                      ),
                      child: isToday ? Center( child: SvgPicture.asset('assets/images/mark.svg', color: Color(0xffFFFFFF)),) : Container(),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Not used this morning', style: TextStyle(fontSize: 18),),
                        Container(
                         width: 200,
                          child:
                        Text('Click on this circle to indicate that you’ve used the medication.', style: TextStyle(fontSize: 14, color: Color(0xff2E2E42)),),
                        )
                          ],
                    )
                  ],
                )
              ],
            )
            )
        )
    );
  }
}