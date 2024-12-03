import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Reading());
}

class Reading extends StatefulWidget {
  const Reading({super.key});
  @override
  _ReadingScreen createState() => _ReadingScreen();
}

class _ReadingScreen extends  State<Reading> {
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
              Text('Reading 1', style: TextStyle(fontSize: 20)),
              Spacer(),
          Container(
            width: 35,
            height: 35,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5),
            ),
            child: Icon(Icons.share),
            ),

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
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black.withOpacity(0.15)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.all(15),
                      child: Column(
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    // Spacer(),
                                    Column(
                                      children: [
                                        Text('107/60', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('SYS/DIA  ', style: TextStyle(fontSize: 10),),
                                            Text('mmHg', style: TextStyle(color: Colors.grey.withOpacity(0.85),fontSize: 10),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFF618F),
                                  ),
                                  width: 46,
                                  height: 46,
                                  padding: EdgeInsets.all(8),
                                  child: SvgPicture.asset('assets/images/hearth.svg'),
                                ),

                              ],
                            ),
                            SizedBox(height: 15,),
                            SvgPicture.asset('assets/images/line.svg'),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text('Irregular ECG'),
                                Spacer(),
                                Icon(Icons.info),
                                Container(
                                  color: Color(0xff1BE43B).withOpacity(0.15),
                                  child: Text('Normal', style: TextStyle(color: Color(0xff1BE43B)),),
                                )
                              ],
                            )
                          ]
                      )
                  ),

                  SizedBox(height: 25),
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                        color: Color(0xffE2EDFF)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline, color: Colors.blue,),
                        SizedBox(width: 7),
                        Text('Edit entry', style: TextStyle(fontSize: 16, color: Colors.blue),),
                      ],
                    ),
                  )

                ],
              ),
            ))));
  }
  edit_entry(){
    return Column(
      children: [
        Text('Edit Entry', style: TextStyle(fontSize: 18)),
        SizedBox(height: 20,),
        Text(

          'Vital to measure',
          style: TextStyle(
            fontSize: 16.0,
          ),
    ),


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
    SizedBox(height: 25.0),

    textField(
    textType: TextInputType.number,
    textHeader: 'Measurement reading',
    textHint: "79 mmHg "
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
    );
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