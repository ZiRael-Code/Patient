import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Account/DeviceSummary.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(DeviceInformation());
}

class DeviceInformation extends StatefulWidget {
  const DeviceInformation({super.key});
  @override
  _DeviceInformationScreen createState() => _DeviceInformationScreen();
}

class _DeviceInformationScreen extends  State<DeviceInformation> {
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
                  'Device Information',
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
            Container(alignment: Alignment.center,child:
            SvgPicture.asset('assets/images/dev.svg', height: 117, width: 195,),
            ),
            SizedBox(height: 30,),
            Text(
              'Name:',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(
              'Wellue Bp2 Connect device',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),


            SizedBox(height: 15),
            SvgPicture.asset('assets/images/line.svg'),

            SizedBox(height: 20),

            // Price
            Text(
              'Price:',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(
              'N25,000.00',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16),
            ),

            SizedBox(height: 15),
            SvgPicture.asset('assets/images/line.svg'),

            SizedBox(height: 20),

            // Vitals measured
            Text(
              'Vitals measured:',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 5),
            Text(
              'Oxygen saturation, blood pressure, stress level, body temperature.',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 15),
            SvgPicture.asset('assets/images/line.svg'),


            SizedBox(height: 30),

            // How many devices do you need?
           Center(child: Text(
              'How many devices do you need?',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            ),

            SizedBox(height: 25),

            // Row for quantity control
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Decrease button
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.remove, size: 16,color: Colors.blue),
                    onPressed: () {
                      // Logic to decrease the number
                    },
                  ),
                ),

                SizedBox(width: 25),

                // Display quantity
                Text(
                  '1',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),

                SizedBox(width: 25),
                // Increase button
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, size: 16, color: Colors.blue),
                    onPressed: () {
                      // Logic to increase the number
                    },
                  ),
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
                      builder: (context) => DeviceSummary(),
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
                  'Place an order',
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