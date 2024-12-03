import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DeviceConnected.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(ConfiguringDevice());
}

class ConfiguringDevice extends StatefulWidget {
  const ConfiguringDevice({super.key});
  @override
  _ConfiguringDeviceScreen createState() => _ConfiguringDeviceScreen();
}

class _ConfiguringDeviceScreen extends  State<ConfiguringDevice> {
  String? _selectedValue;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=> DeviceConnected()));
    });
    // TODO: implement initState
    super.initState();
  }
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
                  'BP2 Connect',
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
        SizedBox(height: 60),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Configuring your device.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),

       SizedBox(height: 50,),
        Container(
          width: 185,
          height: 185,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xffE2EDFF).withOpacity(0.30),
            shape: BoxShape.circle
          ),
          child: SvgPicture.asset('assets/images/dev.svg'),
        ),
      ],
    ),
    )));
  }
}