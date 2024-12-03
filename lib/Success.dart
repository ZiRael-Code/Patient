import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Success());
}

class Success extends StatefulWidget {
  const Success({super.key});
  @override
  _SuccessScreen createState() => _SuccessScreen();
}

class _SuccessScreen extends  State<Success> {
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
                  'Success!',
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
        SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("You have successfully withdrawn funds to your bank account.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),

        Spacer(),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            borderRadius: BorderRadius.circular(9),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: Text(
              'See details',
              style: TextStyle(
                color: Color(0xFF3C8AFF),
              ),
            ),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF3C8AFF),
            ),
            icon: Icon(Icons.keyboard_arrow_down),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            items: <String>['10:00 AM', '12:00 PM', '02:00 PM', '04:00 PM']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 15,),
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
              'Done',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    ))));
  }
}