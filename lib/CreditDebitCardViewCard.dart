import 'package:flutter/material.dart';
import 'package:flutter_app/Account/AccountProfile.dart';
import 'package:flutter_app/MainManvigator.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(CreditDebitCardViewCard());
}

class CreditDebitCardViewCard extends StatefulWidget{
  const CreditDebitCardViewCard({super.key});

  @override
  _CreditDebitCardViewCardState createState() => _CreditDebitCardViewCardState();
}

class  _CreditDebitCardViewCardState extends State<CreditDebitCardViewCard> {
  bool isSwitched = false;

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
                  'Credit/Debit Cards',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 184,
                  child: SvgPicture.asset(
                    'assets/images/atm.svg', fit: BoxFit.fill,),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 184,
                  alignment: Alignment.centerLeft,
                  child:
                  Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: 15, left: 15, bottom: 7, top: 7),
                              decoration: BoxDecoration(
                                color: Color(0x29000000).withOpacity(0.16),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("CARD 1", style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white
                              ),),
                            ),
                            Spacer(),
                            SvgPicture.asset("assets/images/cardicon.svg")
                          ],),

                        SizedBox(height: 20.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child:
                          Text(
                            '1111 2222 3333 4444',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),

                        Row(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Card holder',
                                    style: TextStyle(
                                      fontSize: 9.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    'JONATHAN ALEXANDER DOE',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 60,),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Expiry',
                                    style: TextStyle(
                                      fontSize: 9.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Align(alignment: Alignment.centerLeft,
                                  child: Text(
                                    '01/23',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],)

                      ]),
                ),
              ],),

              SizedBox(height: 25.0),
              textField(
                  textHeader: 'Cardholder full name',
                  textHint: "JONATHAN ALEXANDER DOE",
                  containerWight: MediaQuery
                      .of(context)
                      .size
                      .width
              ),

              SizedBox(height: 25.0),
              textField(
                  textHeader: 'Card number',
                  textHint: "1111 2222 3333 4444",
                  containerWight: MediaQuery
                      .of(context)
                      .size
                      .width
              ),
              SizedBox(height: 25.0),


              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textField(
                      textHeader: 'Expiry date',
                      textHint: "01/23",
                      containerWight: 157
                  ),
                  Spacer(),

                  textField(
                      textHeader: 'CVV',
                      textHint: "***",
                      containerWight: 157
                  ),

                ],),


              Row(
                children: [
                  Text(
                    "Make this card the default card",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),


              Spacer(),
              Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  child: Text(
                    'Delete card',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }


  Widget textField({
    required String textHeader,
    required String textHint,
    required double containerWight
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerLeft, child:
        Text(
          textHeader,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.start,
        ),
        ),
        SizedBox(height: 15.0),
        Container(
          width: containerWight,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 10.0,
          ),
          child: Text(
            textHint,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ],);
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Are you sure you want to delete this card?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainNavigator(),
                          ),
                        );
                      },
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(
                            0.15),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}