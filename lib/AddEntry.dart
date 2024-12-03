import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(AddEntry());
}

class AddEntry extends StatefulWidget {
  const AddEntry({super.key});
  @override
  _AddEntryScreen createState() => _AddEntryScreen();
}

class _AddEntryScreen extends  State<AddEntry> {
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
                  'Add Entry',
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

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child:
              Text(

                'Vital to measure',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),

            SizedBox(height: 15.0),

            // Account Number TextField
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                hintText: 'e.g blood pressure',
                hintStyle: TextStyle(
                  color: Color(0xffF2F2F2),
                ),
                filled: true,
                fillColor: Colors.grey[300],
                contentPadding: EdgeInsets.symmetric(
                  vertical: 15.0, // Height of 50 (including padding)
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],),
        SizedBox(height: 25.0),

        textField(
            textType: TextInputType.number,
            textHeader: 'Vital to measure',
            textHint: "e.g blood pressure"
        ),

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
              'Save entry',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    ))));
  }

  textField({
    required TextInputType textType,
    required String textHeader,
    required String textHint
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child:
          Text(

            textHeader,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),

        SizedBox(height: 15.0),

        // Account Number TextField
        TextField(
          decoration: InputDecoration(
            hintText: textHint,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.grey[300],
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.0, // Height of 50 (including padding)
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: textType,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],);
  }
}