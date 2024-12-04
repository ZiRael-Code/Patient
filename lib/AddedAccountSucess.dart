import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/WithdrawFunds.dart';
import 'package:flutter_svg/svg.dart';

import 'Appointments/AppointmentPaymentSummary.dart';

void main(){
  runApp(AddedAccountSucess());
}

class AddedAccountSucess extends StatefulWidget {
  const AddedAccountSucess({super.key});
  @override
  AddedAccountSucessState createState() => AddedAccountSucessState();
}

class AddedAccountSucessState extends  State<AddedAccountSucess> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      'Success',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal
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
                        width: MediaQuery.of(context).size.width * 0.40,
                        child:

                        Align(child: Text("You have successfully added an account.", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        ),
                      ),
                      Spacer(),
                      SizedBox(height: 15,),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WithdrawFunds(),
                            ),
                          );
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
                            'Done',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}