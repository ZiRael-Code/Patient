import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/SetupComplete.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(SetNewPin());
}

class SetNewPin extends StatefulWidget {
  const SetNewPin({super.key});

  @override
  _SetNewPinScreen createState() => _SetNewPinScreen();
}

class _SetNewPinScreen extends State<SetNewPin> {
  List<String> pin = [];
  List<bool> dotStates = [false, false, false, false]; // For tracking each dot's state
  int buttonClickedX = 0;

  String message = "Set a new PIN for making transactions on the application.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
        child: Align(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset('assets/images/slider2.svg'),
              ),
              SizedBox(height: 30),
              Text(
                'Set new PIN',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.70,
                child: Align(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
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
                  children: List.generate(4, (index) {
                    return dot(color: dotStates[index] ? Color(0xFF000000) : Color(0xFFCCCCCC));
                  }),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(height: 60),
              Container(
                child: Column(
                  children: [
                    Wrap(
                      spacing: 100,
                      runSpacing: 30,
                      children: List.generate(9, (index) {
                        return InkWell(
                          child: number(num: (index + 1).toString()),
                          onTap: () {
                            setState(() {
                              if (pin.length < 4) {
                                pin.add((index + 1).toString());
                                dotStates[pin.length - 1] = true; // Update dot color
                              }
                            });
                          },
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Spacer(),
                        SizedBox(width: 75),
                        number(num: "0"),
                        Spacer(),
                        GestureDetector(
                          child: SvgPicture.asset("assets/images/backspace.svg"),
                          onTap: () {
                            setState(() {
                              if (pin.isNotEmpty) {
                                pin.removeLast();
                                dotStates[pin.length] = false; // Update dot color
                              }
                            });
                          },
                        ),
                        SizedBox(width: 35),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if   (buttonClickedX <= 1){
                      buttonClickedX++;
                      message = "Retype your PIN to confirm.";
                    }else{
                      Navigator.of(context).push(MaterialPageRoute(builder: (builder) => SetupComplete()));
                    }
                  });
                  // Navigator.of(context).push(MaterialPageRoute(builder: (builder) => Signup()));
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
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  dot({required Color color}) {
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

  number({required String num}) {
    return Container(
      child: Text(
      num,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      ),
    );
  }
}
