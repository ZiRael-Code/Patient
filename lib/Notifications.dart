import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(Notifications());
}

class Notifications extends StatefulWidget {
  const Notifications({super.key});
  @override
  _NotificationsScreen createState() => _NotificationsScreen();
}

class _NotificationsScreen extends  State<Notifications> {
  String? _selectedValue;
  bool isPendingSelected = false;
  bool isCheckedSelected = false;

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
                  'Notifications',
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
        SizedBox(height: 30),
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.green, width: 1),
                ),
                child: Container(
                  width: 7.5,
                  height: 7.5,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              SizedBox(width: 7),
              Text('Pending', style: TextStyle(color: Color(0xff2E2E42)),),
              SizedBox(width: 7),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        SizedBox(width: 7),
        Text('Checked', style: TextStyle(color: Color(0xff2E2E42)),),
      ],
          ),
        ),
        SizedBox(height: 25,),
        Align(
          alignment: Alignment.centerLeft,
          child:
        Text('Today', style: TextStyle(fontSize: 20,color: Colors.black, fontWeight: FontWeight.bold))),
        SizedBox(height: 20,),
        notification(
          title: 'Message from Dr. Nelson',
          message: 'Good morning we’re yet to conclude about ...',
          time: '09:00 AM',
          buttonText: 'Reply',
          isChecked: false,
        ),
        notification(
          title: 'New prescription list',
          message: 'You have new drugs from Dr. Nelson',
          time: '09:00 AM',
          buttonText: 'View',
          isChecked: false,
        ),
        notification(
          title: 'Drugs are being delivered',
          message: 'Your drugs are goung to be delivered to you soon',
          time: '09:00 AM',
          buttonText: 'View',
          isChecked: false,
        ),
       notification(
          title: 'Drugs are being delivered',
          message: 'Your drugs are goung to be delivered to you soon',
          time: '09:00 AM',
          buttonText: 'View',
          isChecked: true,
        ),

      ],
    ),
    ))));
  }

  notification({
    required String title,
    required String message,
    required String time,
    required String buttonText,
    required bool isChecked}) {
    return Column(
        children: [
          Row(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: isChecked ?
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Container(
            width: 7.5,
            height: 7.5,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        )
        )
              :
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(50),
            ),
          ),

        ),
        SizedBox(width: 7),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 5),
            Container(
            width: 224,
    child:
            Text(message, style: TextStyle(color: Color(0xff666666), fontSize: 14)),)
            ,SizedBox(height: 12),
            Text(time, style: TextStyle(color: Colors.blue, fontSize: 12)),
    ],
        ),
        Spacer(),
        Align(
          child: SizedBox(
            height: 33,
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(buttonText, style: TextStyle(color: Colors.white),),
            )
          ),
        )
      ],
    ),
          SizedBox(height: 10,),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 10,),
        ]
    );
  }
}