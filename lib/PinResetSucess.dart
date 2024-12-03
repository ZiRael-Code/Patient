import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(PinResetSucess());
}

class PinResetSucess extends StatefulWidget {
  const PinResetSucess({super.key});
  @override
  _PinResetSucessScreen createState() => _PinResetSucessScreen();
}

class _PinResetSucessScreen extends  State<PinResetSucess> {
  String? _selectedValue;
  List<String> pin = [];

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
                      'PIN Settings',
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
                      SizedBox(height:70),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.50,
                        child:
                        Align(child: Text("Type in your former PIN to set a new one.", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        ),
                      ),
                      SizedBox(height: 65),
                      Text("Enter Pin", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 163,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.black.withOpacity(0.05),
                          border: Border.all(color: Color(0xFFE2E2E2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            dot(
                              color: pin.length == 1 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                            ),
                            dot(
                              color: pin.length == 2 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                            ),
                            dot(
                              color: pin.length == 3 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                            ),
                            dot(
                              color: pin.length == 4 ? Color(0xFF000000) : Color(0xFFCCCCCC),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         decoration: BoxDecoration(
                      //           color: Colors.grey,
                      //           shape: BoxShape.circle
                      //         ),
                      //         width: 19,
                      //         height: 19,
                      //       ),
                      //       SizedBox(width: 10,),
                      //       Text(
                      //         'PIN does not match',
                      //         style: TextStyle(
                      //           fontSize: 14.0,
                      //           color: Colors.red,
                      //         ),
                      //       )
                      //     ]
                      //   )
                      // ),


                      SizedBox(height: 60,),

                      Container(
                        child:Column(children: [
                          Wrap(
                            spacing: 100,
                            runSpacing: 30,
                            children:
                            List.generate (9, (index){
                              int indexEdit = index;
                              return number(
                                  num: (index+1).toString()
                              );
                            }),
                          ),
                          SizedBox(height: 20,),
                          Row(children: [
                            Spacer(),
                            SizedBox(width:75),
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
                            SizedBox(width:35)
                          ],)
                        ]),
                      ),
                      SizedBox(height:40),
                      RichText(
                        text: TextSpan(
                          text: 'Forgot your PIN? ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Reset here',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ))));
  }

  dot({
    required Color color
  }) {
    return Container(
      width: 12,
      height: 12,
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
      child: Text(
        num,
        style:
        TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      onTap: () {
        setState(() {
          pin.add(num);
          // if (pin.length == 4) {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => Summary()));
          // }
        });
      },
    );

  }
}