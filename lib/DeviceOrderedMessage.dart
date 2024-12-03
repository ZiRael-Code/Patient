import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnectedSuccess.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Deviceorderedmessage extends StatelessWidget {
  const Deviceorderedmessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:  Align(
        alignment: Alignment.center,
        child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text("Device Ordered", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Container(
          width: 258,
          child:
            Text(style: TextStyle(fontSize: 18)
                ,textAlign: TextAlign.center,"Your device has been ordered and will soon get to you. You will be notified once it is available.")
        ),
            Spacer(),
            SvgPicture.asset("assets/images/drive.svg"),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => DeviceConnectedSuccess()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                child: Text(
                  'Finish',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
      ),
      ),
    );
  }
}
