import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Account/DeviceOrderedSuccess.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(DeviceSummary());
}

class DeviceSummary extends StatefulWidget {
  const DeviceSummary({super.key});
  @override
  _DeviceSummaryScreen createState() => _DeviceSummaryScreen();
}

class _DeviceSummaryScreen extends  State<DeviceSummary> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Summary',
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
              padding: EdgeInsets.all(25),
              child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45,),
            Container(alignment: Alignment.center,child:
            SvgPicture.asset('assets/images/dev.svg', height: 117, width: 195,),
            ),
            SizedBox(height: 70,),

              Center(child:
              Text(
              'Wellue Bp2 Connect device',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            ),

            SizedBox(height: 10),
            // Summary

              Align(
                alignment: Alignment.center,
                child:
              SizedBox(
                width: 150,
              child:
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(width: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'PRICE: ',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(width: 5),
                  Text( 
                    'N25,000.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ),
            ),


            SizedBox(height: 25,),

            Wrap(
              direction: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Text("Arrival date:"),
                    Spacer(),
                    Text("9th August 2022"),
                  ],
                ) ,
                SizedBox(height: 40),
                Row(
                  children: [
                    Text("Price:"),
                    Spacer(),
                    Text("N25,000.00"),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text("Quantity:"),
                    Spacer(),
                    Text("1"),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text("Delivery fee:"),
                    Spacer(),
                    Text("N1,500.00"),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Text("TOTAL:", style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text("N26,550.00"),
                  ],
                ),
              ],
            ),

            Spacer(),

            // Place an Order button
            SizedBox(
              height: 55,
              width: double.infinity, // Match screen width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeviceOrderSuccess(),
                    ),
                  );
                  // Logic for placing an order
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Border radius of 12
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Proceed with online payment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 45,),
          ],
        )
        )

      );
  }
}