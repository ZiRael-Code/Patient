import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Account/Device.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(DeviceOwned());
}

class DeviceOwned extends StatefulWidget {
  const DeviceOwned({super.key});
  @override
  _DeviceOwnedScreen createState() => _DeviceOwnedScreen();
}

class _DeviceOwnedScreen extends  State<DeviceOwned> {
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
                  'Devices owned',
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
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.58,
          child:
        Align(child: Text("View history of any vitals by directly tapping on their icons. ", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),SizedBox(height: 20,),

        Wrap(children: [
          devices(
              name: "BP2 Connect",
              imagePath: "assets/images/dev.svg"
          ),
          SizedBox(width: 20,),
          devices(
              name: "Device 2",
              imagePath: "assets/images/dev.svg"
          ),
          devices(
              name: "Device 3",
              imagePath: "assets/images/dev.svg"
          ),
        ],),

        ]))))
      ) ;
  }

  devices({
    required String name,
    required String imagePath
  }) {
    return  GestureDetector(
        onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Device(),
        ),
      );
    },
    child:  Container(
      child: Column(children: [
        Container(
          width: 143,
          height: 143,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Colors.black.withOpacity(0.2))
          ),
          child:
          Center(child: SvgPicture.asset(imagePath),),
        ),
        SizedBox(height: 10,),
        Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 20, ),
      ],),),
    );
  }


}