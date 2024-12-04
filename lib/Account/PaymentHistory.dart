import 'package:flutter/material.dart';
import 'package:flutter_app/Account/Monty.dart';
import 'package:flutter_app/TransactionDetails.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(PaymentHistory());
}

class PaymentHistory extends StatefulWidget {

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();

}



class _PaymentHistoryState extends State<PaymentHistory> {
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
                  'Payment history',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                height: 23,
                width: 23,
                child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 15,),),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.20),
                ),
              ),
              SizedBox(width: 8,),
              InkWell(
                onTap: (){
                  showMonthySheet();
                },
                child:
                Text(
                'August',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(width: 8,),
              Container(
                height: 23,
                width: 23,
                child: Center(child:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue, size: 15,),),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.20),
                ),
              ),


            ],),

              SizedBox(height: 35,),
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
                  transactionHistories(
                    date: "16/08/2022",
                    name: "WELLUE BP2 CONNECT",
                    type: "Device",
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
    );
  }



  transactionHistories({
    required String date,
    required String name,
    required String type,
    required String price
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionDetails(),
          ),
        );
      },
        child: Container(
      child:
      Column(
        children: [
          Row(children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
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
      ),
    );
  }

  void showMonthySheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Monty()
          );
        }
    );
  }
}