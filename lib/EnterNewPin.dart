import 'package:flutter/material.dart';
import 'package:flutter_app/RetypePin.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(const EnterNewPin());
}

class EnterNewPin extends StatefulWidget {
  const EnterNewPin({super.key});
  @override
  _AppointmentPaymentScreen createState() => _AppointmentPaymentScreen();
}

class _AppointmentPaymentScreen extends  State<EnterNewPin> {
  String? _selectedValue;
  List<String> pin = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xFFE5E5E5),
                    ),
                    child: SvgPicture.asset('assets/images/back.svg',
                      width: 8.0,
                      height: 15,),
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child:
                    const Center(child: Text(
                      'PIN Settings',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal
                      ),
                    ),
                    ),
                  ),
                  const Spacer(),

                ],
              ),
              centerTitle: true,
            ),
            body:
            Container(
                padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child:
                Align(
                  child:
                  Column(
                    children: [
                      const SizedBox(height:70),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.50,
                        child:
                        const Align(child: Text("Enter new PIN.", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        ),
                      ),
                      const SizedBox(height: 65),
                      const Text("Enter Pin", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: 163,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.black.withOpacity(0.05),
                          border: Border.all(color: const Color(0xFFE2E2E2)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            dot(
                               pin.length >= 1  ? const Color(0xFF000000) : const Color(0xFFCCCCCC),
                            ),
                            dot(
                              pin.length >= 2 ? const Color(0xFF000000) : const Color(0xFFCCCCCC),
                            ),
                            dot(
                              pin.length >= 3 ? const Color(0xFF000000) : const Color(0xFFCCCCCC),
                            ),
                            dot(
                              pin.length == 4 ? const Color(0xFF000000) : const Color(0xFFCCCCCC),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
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


                      const SizedBox(height: 4,),

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
                          const SizedBox(height: 20,),
                          Row(children: [
                            const Spacer(),
                            const SizedBox(width:75),
                            number(num: "0"),
                            const Spacer(),
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
                            const SizedBox(width:35)
                          ],)
                        ]),
                      ),
                      const SizedBox(height:40),
                      RichText(
                        text: const TextSpan(
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
                )) );
  }

  dot(
    Color color
  ) {
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.all(4),
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
        const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    ),
        onTap: () {
      setState(() {
        if (pin.length == 4) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RetypePin()));
        }else if( pin.length < 5){
          pin.add(num);
        }
        // if (pin.length == 4) {
        // }
      });
    },
    );

  }
}