import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/VitChatBot.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(CustomerCareOption());
}

class CustomerCareOption extends StatefulWidget {
  const CustomerCareOption({super.key});
  @override
  _CustomerCareOptionScreen createState() => _CustomerCareOptionScreen();
}

class _CustomerCareOptionScreen extends  State<CustomerCareOption> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                  'Customer Care',
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
              padding: EdgeInsets.only(left: 15, right: 15),
              child:
            Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VitChatBot()));
                      },
                    child:
          careOption(
            careName: Row(children: [
              Text(
                'Engage chatbot',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Blue forward arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],),
            careImgPath: "assets/images/careimgage.svg",
            description: "Talk with an automated responder to help you sort any little issues you may have with myvitalz."
          ),
          ),
              SizedBox(height: 20,),
        careOption(
            careName: Row(children: [
              Text(
                'Send Mail',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Blue forward arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],),
            careImgPath: "assets/images/email.svg",
            description: "Send an email to our official email address myvitalzsupport@myvitalz.com if you need to communicate with us."
          ),

              SizedBox(height: 20,),
              careOption(
            careName: Row(children: [
              Text(
                'Hotline',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              // Blue forward arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.blue,
              ),
            ],),
            careImgPath: "assets/images/phone.svg",
            description: "You can call us directly on phone if you have pressing issues you need to fix."
          ),
    ]
            ),
      ));
  }

  careOption({
    required careName,
    required careImgPath,
    required description
  }) {
    // Column with text and row
    return Container(
      height: 137,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFE5E5E5), width: 1),
      ),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Circular container
          Container(
            width: 59,
            height: 59,
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFFE2EDFF),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(careImgPath),
          ),
          SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               careName,
                SizedBox(height: 15),

              Container(
                padding: EdgeInsets.only(right: 30),
                child:
                Text(
                  description,
                  style: TextStyle(
                    color: Color(0xFF2E2E42),
                    fontSize: 12,
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}