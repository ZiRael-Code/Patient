import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Appointments/AppointmentPaymentSummary.dart';

void main(){
  runApp(AddAccount());
}

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});
  @override
  _AddAccountScreen createState() => _AddAccountScreen();
}

class _AddAccountScreen extends  State<AddAccount> {
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
                      'Add Account',
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
            body:  Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  textField(
                    textType: TextInputType.number,
                    textHeader: 'Account Number',
                    textHint: "Enter account number"
                  ),

                  SizedBox(height: 25.0),
                  textField(
                    textType: TextInputType.number,
                    textHeader: 'Bank name',
                    textHint: "Bank"
                  ),
              SizedBox(height: 25,),
                  Align(
                    child:
                      Container(
                    width: 178,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color(0xFFE2EDFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                      },
                      child: Text(
                        'Confirm name',
                        style: TextStyle(
                          color: Color(0xFF3C8AFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  ),

                ],
              ),
            ),
           ));
  }

  textField({
    required TextInputType textType,
    required String textHeader,
    required String textHint
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    Align(
      alignment: Alignment.centerLeft,
      child:
    Text(

    textHeader,
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    ),

    SizedBox(height: 15.0),

    // Account Number TextField
    TextField(
    decoration: InputDecoration(
    hintText: textHint,
    hintStyle: TextStyle(
    color: Colors.grey,
    ),
    filled: true,
    fillColor: Colors.grey[300],
    contentPadding: EdgeInsets.symmetric(
    vertical: 15.0, // Height of 50 (including padding)
    horizontal: 10.0,
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
    ),
    ),
    keyboardType: textType,
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    ],);
  }
}