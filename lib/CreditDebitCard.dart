import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(CreditDebitCard());
}

class CreditDebitCard extends StatelessWidget{
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
                      'Wallet',
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
                  height: 90,
                  child: SvgPicture.asset('assets/images/card.svg', fit: BoxFit.fill,),
                ),
              Container(
                padding: EdgeInsets.only(left: 20),
                width: double.infinity,
                  height: 90,
                  alignment: Alignment.centerLeft,
                  child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  'Wallet Balance',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white
                  ),
                ),
                Text(
                  'N35,500',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),

              ],))

                ],),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  quickAction(
                      iconPath: 'assets/images/icons/dashboard/electric.png',
                      actionText: 'Fund wallet'
                  ),
                  SizedBox(width: 15,),
                  quickAction(
                      iconPath: 'assets/images/icons/dashboard/device.png',
                      actionText: 'Withdraw fund'
                  ),
                ],),
                SizedBox(height: 30,),
                Container(child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Recent transactions",
                      style: TextStyle(fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),),
                    Spacer(),
                    ElevatedButton(
                      onPressed: (){
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent

                      ),
                      child: Text('See all',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF3C8AFF),
                        ),
                      ),
                    ),
                  ],
                ),
                ),
                SizedBox(height: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               transactionHistories(
                 date: "'16/08/2022'",
                 name: "DR KELVIN APPOINTMENT",
                 type: "Appointment",
                 price: "N20,000",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "HYPERTENSION MEDICATION",
                 type: "Medications",
                 price: "N13,000",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "WELLUE BP2 CONNECT",
                 type: "Device",
                 price: "N8,500",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "HYPERTENSION MEDICATION",
                 type: "Medications",
                 price: "N13,000",
               ),
                transactionHistories(
                 date: "16/08/2022",
                 name: "WELLUE BP2 CONNECT",
                 type: "Device",
                 price: "N13,000",
               ),

            ],),







              ],
            ),
          ),
        ),
      );

  }




  Widget quickAction({
    required String iconPath,
    required String actionText,
  }){
    return Container(
      width: 150,
      height: 51,
      padding: EdgeInsets.only(top: 12, left: 10.0, bottom: 12, right: 10),
      decoration: BoxDecoration(
        color: Color(0xFFC4DCFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          children: [
            Center(
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: Color(0xFF3C8AFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: 11,
                    height: 14,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Text(actionText,
              style: TextStyle(
                  fontSize: 10.0,
                  color: Color(0xFF3C8AFF),
              ),),
          ],
        ),
      ),
    );
  }

  transactionHistories({
    required String date,
    required String name,
    required String type,
    required String price
  }) {
    return  Container(
      padding: EdgeInsets.only(right: 20),
      child:
      Column(
        children: [
          Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),

            ],),
          ],),
          SizedBox(height: 10,),
          Container(
            width: 313,
            height: 2,
            decoration: BoxDecoration(
              color: Color(0x1A2E2E42),
            ),
          ),
          SizedBox(height: 15,)
        ],
      ),
    );
  }


}