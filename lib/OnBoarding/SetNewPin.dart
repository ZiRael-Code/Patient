import 'package:flutter_app/SetupComplete.dart';

import '../Main/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



void main(){
  runApp(SetNewPin());
}

class SetNewPin extends StatefulWidget {
  SetNewPin({super.key});
  @override
  _AppointmentPaymentScreen createState() => _AppointmentPaymentScreen();
}

class _AppointmentPaymentScreen extends  State<SetNewPin> {
  String? _selectedValue;
  List<String> pin = [];
  int trial = 1;
  String message = "Set a new PIN for making transactions on the application.";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child:
                Container(
                  width: getFontSize(35, context),
                  height: getFontSize(35, context),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: SvgPicture.asset('assets/images/back.svg',
                    width: getFontSize(8.0, context),
                    height: getFontSize(15, context),),
                ),
              ),

              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'PIN Settings',
                  style: TextStyle(
                      fontSize: getFontSize(20, context),
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
            padding: EdgeInsets.only(bottom: getFontSize(30, context), left: getFontSize(15, context), right: getFontSize(15, context)),
            child:
            Align(
              child:
              Column(
                children: [
                  SizedBox(height: getFontSize(70, context)),

                    Align(child: Text("Set new PIN.", textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getFontSize(36, context),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  SizedBox(height: getFontSize(35, context)),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.50,
                    child:
                  Text(message, textAlign: TextAlign.center,
                    style: TextStyle(
                    ),
                  ),
                  ),
                  SizedBox(height: getFontSize(20, context),),
                  Container(
                    width: getFontSize(163, context),
                    height: getFontSize(50, context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Colors.black.withOpacity(0.05),
                      border: Border.all(color: Color(0xFFE2E2E2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        dot(
                          pin.length >= 1  ? Color(0xFF000000) : Color(0xFFCCCCCC),
                        ),
                        dot(
                          pin.length >= 2 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                        ),
                        dot(
                          pin.length >= 3 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                        ),
                        dot(
                          pin.length == 4 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getFontSize(30, context),),
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.grey,
                  //           shape: BoxShape.circle
                  //         ),
                  //         width: getFontSize(19, context),
                  //         height: getFontSize(19, context),
                  //       ),
                  //       SizedBox(width: getFontSize(10, context),),
                  //       Text(
                  //         'PIN does not match',
                  //         style: TextStyle(
                  //           fontSize: getFontSize(14.0, context),
                  //           color: Colors.red,
                  //         ),
                  //       )
                  //     ]
                  //   )
                  // ),


                  SizedBox(height: getFontSize(4, context),),

                  Container(
                    child:Column(children: [
                      Wrap(
                        spacing: 90,
                        runSpacing: 30,
                        children:
                        List.generate (9, (index){
                          int indexEdit = index;
                          return number(
                              num: (index+1).toString()
                          );
                        }),
                      ),
                      SizedBox(height: getFontSize(20, context),),
                      Row(children: [
                        Spacer(),
                        SizedBox(width: getFontSize(75, context)),
                        number(num: "0"),
                        Spacer(),
                        GestureDetector(
                          child: SvgPicture.asset("assets/images/backspace.svg"),
                          onTap: () {
                            setState(() {
                              if (pin.isNotEmpty) {
                                pin.removeLast();
                              }
                            });
                          },
                        ),
                        SizedBox(width: getFontSize(35, context))
                      ],)
                    ]),
                  ),
                ],
              ),
            )) );
  }

  dot(
      Color color
      ) {
    return Container(
      width: getFontSize(12, context),
      height: getFontSize(12, context),
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  number({
    required String num
  }) {
    return GestureDetector(
      child:Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(8),
        child: Text(
          num,
          style:
          TextStyle(
            fontSize: getFontSize(32, context),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          if (pin.length == 3) {
            trial == 2 ? Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> SetupComplete())) : trial++;
            message = "Retype your PIN to confirm";
            pin.clear();
          }else if( pin.length < 5){
            // trial++;
            pin.add(num);
          }
          // if (pin.length == 4) {
          // }
        });
      },
    );

  }
}