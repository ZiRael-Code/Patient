import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Referrals.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(SendInvites());
}

class SendInvites extends StatefulWidget {
  const SendInvites({super.key});
  @override
  _SendInvitesScreen createState() => _SendInvitesScreen();
}

class _SendInvitesScreen extends  State<SendInvites> {
  String? _selectedValue;

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
                  'Send Invites',
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
        body: Column(
          children: [
          Text(
          'Invite friends and loved ones to MyVitalz through your phonebook to help them avoid stroke, heart attack, kidney failure and sudden death.',
          style: TextStyle(fontSize: 14),
        ),
          SizedBox(height: 20),
          Text(
            'To download the MyVitalz app, click on this link to download from playstore or app store:',
            style: TextStyle(fontSize: 14),
          ),
          Row(children: [
            Text('Link: ', style: TextStyle(color: Colors.black, fontSize: 14)),

          GestureDetector(
            onTap: () {

            },
            child: Text(
              '7f4j6n8qN6EDCP-9wd/8ac6g7ewo87',
              style: TextStyle(  
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,              ),
            ),
          ),
          ]
        ),
          SizedBox(height: 20,),
          SvgPicture.asset("assets/images/line.svg"),
            SizedBox(height: 15,),
            Text(
              '4 Contacts selected',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                contact(
                  alphaOrder: 'A',
                  name: "Alexander Trelawney"
                ),
                contact(
                  alphaOrder: 'A',
                  name: "Alexander Trelawney"
                ),
                contact(
                  alphaOrder: 'B',
                  name: "Benjamin Osagie"
                ),
                contact(
                    alphaOrder: 'A',
                    name: "Alexander Trelawney"
                ),
              ],),
            ),
          Spacer(),
            Container(
              height: 299,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                border: Border.all(color: Color(0xff000000).withOpacity(0.10))
              ),
              child: Column(
                children: [

                ],
              ),
            )


          ],
        )

      ));
  }

  contact({
    required String alphaOrder,
    required String name}) {
    return
          Container(
            margin: EdgeInsets.only(right: 15),
            width: 75,
            height: 124,
            child: Column(
              children: [
              Container(
              width: 70,
              height: 70,
              child: Stack(
                children: [
                Container(
                  alignment: Alignment.center,
                width: 63,
                height: 63,
                  decoration: BoxDecoration(
                    color: Color(0xff2e2e42),
                    shape: BoxShape.circle
                  ),
                  child: Text(alphaOrder, style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.cancel, color: Colors.red,),
                  ),

                ],
              ),
              ),

                SizedBox(height: 10,),
                Text(
                  name,
                  style: TextStyle(fontSize: 16,),
                ),
                SizedBox(height: 5,),

              ],
          )
    );
  }

  referOption({
    icon,
    required String referText
  }) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(25),
          width: 86,
          height: 86,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffE2EDFF)
          ),
          child: icon is Icon ? icon : SvgPicture.asset(icon, width: 26, height: 26,),
        ),
        SizedBox(height: 15,),
        Text("Refer a regular person", style: TextStyle(
            fontSize: 14
        ),)
      ],
    );
  }
}