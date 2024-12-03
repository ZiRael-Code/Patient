import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnect.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(AddDeviceToPhone());
}

class AddDeviceToPhone extends StatefulWidget {
  const AddDeviceToPhone({super.key});
  @override
  _AddDeviceToPhoneScreen createState() => _AddDeviceToPhoneScreen();
}

class _AddDeviceToPhoneScreen extends  State<AddDeviceToPhone> {
  String? _selectedValue;
  bool deviceFound = false;

  @override
  void initState() {
    // TODO: implement initState
      Future.delayed(const Duration(milliseconds: 2000), () {
        setState(() {
          deviceFound = true;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5).withOpacity(0.40),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  color: Colors.white,
                  height: 15,),
              ),
              Spacer(),
          
          GestureDetector(
            child: 
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5).withOpacity(0.40),
            ),
            child: Icon(Icons.info_outlined, color: Colors.white,),


          ),
            onTap: ()=>{
              showHowToConnectPopup(context)
            },
          )
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

        Align(child: Text("Add your device", textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Please switch your device on and make sure your phone’s bluetooth is on.", textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        ),
        ),
        ),

        SizedBox(height: 60),
       deviceFound ? GestureDetector(
    onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> DeviceConnect()));
         },
           child: Container(
             padding: EdgeInsets.all(15),
         width: 183,
         height: 183,
         decoration: BoxDecoration(
           color: Colors.white,
           shape: BoxShape.circle,
         ),
         child: SvgPicture.asset('assets/images/dev.svg'),
       )
       )
       : SvgPicture.asset('assets/images/search.svg'),
        SizedBox(height: 40),

        
      ],
    ),
    ))));
  }


  void showHowToConnectPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: howToConnectPopup(),
        );
      },
    );
  }

  Widget howToConnectPopup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'How to connect?',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        SizedBox(height: 25),
        numbering(
          number: "1",
          text: "Make sure the device is fully charged and turn on the device",
        ),
        numbering(
          number: "2",
          text: "Keep your phone and device within 1 meter.",
        ),
        numbering(
          number: "3",
          text: "Turn on the bluetooth of the mobile phone.",
        ),
      ],
    );
  }

  Widget numbering({required String number, required String text}) {
    return Container(
        child: Row(
      children: [
        Container(
          width: 20,
          height: 20,
          margin: EdgeInsets.only(right: 7),
          child: Center(
            child: Text(
              number,
              style: TextStyle(color: Color(0xFF2E2E42)),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2).withOpacity(0.5),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 6,
          ),
        ),
      ],
    ),
    margin: EdgeInsets.only(bottom: 10),
    );
  }

}