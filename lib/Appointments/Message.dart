import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/Chat.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Message());
}

class Message extends StatefulWidget {
  const Message({super.key});
  @override
  _MessageScreen createState() => _MessageScreen();
}

class _MessageScreen extends  State<Message> {
  String? _selectedValue;

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
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Message',
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
        body: SingleChildScrollView(
    child:
        Container(
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 30),
        Container(
          padding: EdgeInsets.only(right: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Specialist',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: 35),

       message(
         profile: 'assets/images/doc1.png',
         isActive: true,
         name: 'Dr. Nelson Yang',
         message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
         time: '5min',
         unReadSms: "1",
       ),

      message(
       profile: 'assets/images/doc.png',
       isActive: false,
       name: 'Dr. Nelson Yang',
       message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
       time: '5min',
       unReadSms: "",
     ),
        message(
          profile: 'assets/images/doc1.png',
          isActive: true,
          name: 'Dr. Nelson Yang',
          message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
          time: '5min',
          unReadSms: "2",
        ),
        message(
          profile: 'assets/images/doc.png',
          isActive: false,
          name: 'Dr. Nelson Yang',
          message: 'Hi, I need help with my appointment. Please provide me with the necessary details.',
          time: '9min',
          unReadSms: "",
        ),
      ],
    ),
    ))));
  }

  message({
    required String profile,
    required bool isActive,
    required String name,
    required String message,
    required String time,
    required String unReadSms,
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Chat()));
      },
        child: Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                // Profile Picture with Green Dot (Online Indicator)
                Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 49,
                        height: 49,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(profile),
                        ),
                      ),
                      Positioned(
                        bottom: 0, // Moves to the bottom
                        right: 0,  // Moves to the right
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: isActive ? Colors.green : Colors.transparent,
                            border: Border.all(
                              color: isActive ? Colors.white : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 18)),
                    SizedBox(height: 3),
                    Container(
                      width: 214,
                      child: Text(
                        "After taking the prescribed medications I started noticing some changes",
                        style: TextStyle(fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            unReadSms.toString().isEmpty ?
                Container(
                    alignment: Alignment.topRight,
                    child:
                Text(time, style: TextStyle(color: Color(0xff2E2E42)),))
            :
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Text(
                  unReadSms.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        SvgPicture.asset('assets/images/line.svg'),
        SizedBox(height: 20),
      ],
    )
    );
  }

}