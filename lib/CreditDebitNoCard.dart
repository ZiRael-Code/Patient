import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CreditDebitCardAddCard.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(CreditDebitNoCard());
}

class CreditDebitNoCard extends StatefulWidget {
  const CreditDebitNoCard({super.key});

  @override
  _CreditDebitNoCardScreen createState() => _CreditDebitNoCardScreen();
}

class _CreditDebitNoCardScreen extends State<CreditDebitNoCard> {
  String? _selectedValue;
  bool isSelected = false;



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
                    child: SvgPicture.asset(
                      'assets/images/back.svg',
                      width: 8.0,
                      height: 15,
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Withdraw funds',
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child: Align(
                  child: Column(
                    children: [
                      SizedBox(height: 130),

                      SvgPicture.asset("assets/images/wallecuatet.svg"),
                      SizedBox(height: 140),
                      Center(child: Text(
                        'You have no cards yet.',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreditDebitCardAddCard(),
                            ),
                          );
                        },
                        child:
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Color(0xFF3C8AFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child:  Text(
                            'Add new card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
  }

}

