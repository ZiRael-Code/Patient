import 'package:flutter/material.dart';
import 'package:flutter_app/Account/CreditCardAddedSucess.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(CreditDebitCardAddCard());
}

class CreditDebitCardAddCard extends StatefulWidget{
  const CreditDebitCardAddCard({super.key});

  @override
  _CreditDebitCardAddCardState createState() => _CreditDebitCardAddCardState();
}

class  _CreditDebitCardAddCardState extends State<CreditDebitCardAddCard>{
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
                  width: MediaQuery.of(context).size.width,
                  height: 184,
                  child: SvgPicture.asset('assets/images/atm.svg', fit: BoxFit.fill,),
                ),
              Container(
                padding: EdgeInsets.all( 20),
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
                  padding: EdgeInsets.only(right: 15, left: 15, bottom: 7, top: 7),
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
                    textType: TextInputType.number,
                    textHeader: 'Cardholder full name',
                    textHint: "Input name on card",
                    containerWight: MediaQuery.of(context).size.width
                ),

                SizedBox(height: 25.0),
                textField(
                    textType: TextInputType.number,
                    textHeader: 'Card number',
                    textHint: "XXXX  XXXX  XXXX  XXXX",
                    containerWight: MediaQuery.of(context).size.width
                ),
                SizedBox(height: 25.0),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  textField(
                      textType: TextInputType.number,
                      textHeader: 'Expiry date',
                      textHint: "00/00",
                      containerWight: 157
                    ),
                  Spacer(),

                  textField(
                      textType: TextInputType.number,
                      textHeader: 'CVV',
                      textHint: "0000",
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreditCardAddedSucess(),
                      ),
                    );
                  },
                  child:
                Container(
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Color(0xFF3C8AFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
    required TextInputType textType,
    required String textHeader,
    required String textHint,
    required double containerWight
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

        Container(
        width: containerWight,
        child: TextField(
        decoration: InputDecoration(
        hintText: textHint,
        hintStyle: TextStyle(
        color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.grey[300],
        contentPadding: EdgeInsets.symmetric(
        vertical: 15.0, // Adjust padding to control height
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
    )

    ],
    );
  }


}