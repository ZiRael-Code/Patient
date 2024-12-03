import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(QrCodeScan());
}

class QrCodeScan extends StatefulWidget {
  const QrCodeScan({super.key});
  @override
  _QrCodeScanScreen createState() => _QrCodeScanScreen();
}

class _QrCodeScanScreen extends  State<QrCodeScan> {
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
        Container(
          width: 234,
          child: Text(textAlign: TextAlign.center,'QR Code scan',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 15,),
        Container(
          width: 284,
          child: Text(textAlign: TextAlign.center,'Scan the code on the device box to check it’s compatibility with the app',style: TextStyle(fontSize: 14,),),
        ),

        Spacer(),
        SvgPicture.asset('assets/images/qrcode.svg'),
        Spacer(),

        SizedBox(height: 25,),
        ElevatedButton(
          onPressed: () {},
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
              'Scan QR code',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    ))));
  }

}