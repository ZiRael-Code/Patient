import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(VitChatBot());
}

class VitChatBot extends StatefulWidget {
  const VitChatBot({super.key});
  @override
  _VitChatBotScreen createState() => _VitChatBotScreen();
}

class _VitChatBotScreen extends  State<VitChatBot> {
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
                Row(
                  children: [
                    Image.asset("assets/images/vit.jpg"),
                    SizedBox(width: 10),
                    Column(
                      children: [

                        Row(children: [
                        Text(
                          'Vit the Chatbot',
                          style: TextStyle(
                            color: Colors.black, // Black text color
                            fontSize: 16, // Font size 16
                          ),
                        ),
                          SizedBox(width: 7,),
                          SvgPicture.asset("assets/images/verified.svg")
                        ],),
                      SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                          ),
                        ],
                    ),
                      ],),
                  ],
                ),
              ),
              Spacer(),

            ],
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 25, bottom: 25),
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("Wed 8:21 AM"),
              SizedBox(height: 70),

           incomingMessage(
               text: 'Hello, I’m Vit! 😁👋 How can I help you?'),
              SizedBox(height: 40,),
              outGoingMessage(text: "How do I use my device?"),

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



      ));


  }
  incomingMessage({
  required String text,
}){
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
            ),
          ),
        ],
      ),
    );

  }

outGoingMessage({
  required String text,
}){
  return Align(
    alignment: Alignment.centerRight,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
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
      ],
    ),
  );
}





}