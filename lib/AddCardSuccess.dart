import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppointmentPaymentSummary.dart';

void main(){
  runApp(AddCardSuccess());
}

class AddCardSuccess extends StatefulWidget {
  const AddCardSuccess({super.key});
  @override
  _AddCardSuccessScreen createState() => _AddCardSuccessScreen();
}

class _AddCardSuccessScreen extends  State<AddCardSuccess> {
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
                    Text(
                      'Withdraw funds',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Spacer(),

                ],
              ),
            ),
            body:
            Container(
                padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child:
                Align(
                  child:
                  Column(
                    children: [
                      SizedBox(height: 50),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.70,
                        child:

                        Align(child: Text("You have successfully added a new card for transactions.", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width * 0.477),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Add account',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}