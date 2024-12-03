import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Chat());
}

class Chat extends StatefulWidget {
  const Chat({super.key});
  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends  State<Chat> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
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
                SizedBox(width: 25,),
                Align(
                    alignment: Alignment.centerLeft,
                  child:
                Column(children: [
                Text('Dr. Nelson Yang', style: TextStyle(fontSize: 18),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF218130)
                        ),
                        width: 11,
                        height: 11,
                      ),
                    ),

                    SizedBox(width: 7,),
                    Text(
                        'Active now',
                        style: TextStyle(
                          color: Color(0xff2E2E42),
                          fontSize: 16,
                        ))],
                ),
                ],),),
              Spacer(),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xffE2EDFF),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.call, color: Colors.blue,),
            ),
              SizedBox(width: 12,),
              Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xffE2EDFF),
                shape: BoxShape.circle
              ),
              child: Icon(Icons.more_horiz_rounded, color: Colors.blue,),
            )
            ],
          ),
          centerTitle: true,
        ),
        body:

    Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 25),
          child:
          Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                  child:
            Column(
            children: [
              SizedBox(height: 20),
              Text("Wed 8:21 AM"),
              SizedBox(height: 70),

           incomingMessage(
               text: 'Hello, I’m Dr. Nelson! 👋How can I help you?'),
              outGoingMessage(text: "I am not feeling too well. I woke up with a fever this morning. What should i do?"),

           incomingMessage(
               text: 'Oh, I see. Sorry about that. Please click on the blue icon at the bottom right of your screen to select your symptoms.'),
              outGoingMessage(text: "Okay"),

              incomingMessage(
                  text: 'Use these medications'),

            Align(
              alignment: Alignment.centerLeft,
            child:
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0x331BD939).withOpacity(0.080),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color(0x4D218130).withOpacity(0.070),
                  width: 2, // Border width
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 SvgPicture.asset('assets/images/pill1.svg'),
                  SizedBox(width: 8),
                  // Text content
                      Text(
                        '12/06/2022 - ',
                        style: TextStyle(
                          color: Color(0xff218130),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Prescriptions',
                        style: TextStyle(
                          color: Color(0xff218130),
                        ),
                  ),
                ],
              ),
            ),
            ),

              // Spacer(),
              ]),
      )
      ),
              Spacer(),

              Row(

                children: [
                  // TextField
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Color(0x66BFBFBF),
                            width: 0.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(
                            color: Color(0x66BFBFBF),
                            width: 0.5,
                          ),
                        ),
                        suffixIcon: Container(
                          width: 96,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(Icons.attach_file, color: Colors.grey),
                                onPressed: () {
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.mic, color: Colors.grey),
                                onPressed: () {
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Container(
                    width: 51,
                    height: 51,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),

    ],
          ),


      )));


  }
  incomingMessage({
    required String text,
  }) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 260,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      softWrap: true, // Ensure the text wraps when needed
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }


  outGoingMessage({
  required String text,
}){
  return Column(children: [
    Align(
    alignment: Alignment.centerRight,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 301,
          ),
        child:
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFF3C8AFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
        ),
      ],
    ),
  ),
    SizedBox(height: 20,),
  ]
  );
}





}