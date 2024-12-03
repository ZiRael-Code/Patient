import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MeasureVitalsManually.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureVitalsManuallyMenu());
}

class MeasureVitalsManuallyMenu extends StatefulWidget {
  const MeasureVitalsManuallyMenu({super.key});
  @override
  _MeasureVitalsManuallyMenuScreen createState() => _MeasureVitalsManuallyMenuScreen();
}

class _MeasureVitalsManuallyMenuScreen extends  State<MeasureVitalsManuallyMenu> {
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
                  'Measure vitals manually',
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
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 65,),
        SvgPicture.asset('assets/images/machine.svg'),
        SizedBox(height: 145,),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.69,
          child:
          Align(child: Text("You can still take records of your vitals’ readings even if you don’t have a device yet. Let a verified personnel take your readings and input the values here.", textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          ),
        ),

        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureVitalsManually()));
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
              'Continue',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    )));
  }
}