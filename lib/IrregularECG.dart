import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(IrregularECG());
}

class IrregularECG extends StatefulWidget {
  const IrregularECG({super.key});
  @override
  _IrregularECGScreen createState() => _IrregularECGScreen();
}

class _IrregularECGScreen extends  State<IrregularECG> {
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
                width: 35,
                height: 35,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5),
                ),
                child: Center(child: Icon(Icons.share)),
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
        SizedBox(height: 30),

           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SYS/DA text at the top
                // Adding some space between the rows

                // Row with main value and container
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Main value (107/60)
                      Text(
                        '79',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      // Container with background and icon
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF618F),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,  // Replace with your preferred icon
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  Row(children: [
                    Text(
                      'SYS/DA',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 9,),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],),
                ],),

                SizedBox(height: 20),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: 20),

                Row(
                  children: [
                    Icon(Icons.info, color: Colors.grey.withOpacity(0.70),),
                    SizedBox(width: 10,),
                    Text(
                      'Irregular ECG',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red
                      )
                    )
              ],

            )
              ],
           ),
        SizedBox(height: 60,),
        Container(
          width: double.infinity,
          height: 299,
          child: Image.asset('assets/images/graph.png'),
          decoration: BoxDecoration(
            
          ),
        ),
        SizedBox(height: 60),
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
              'Back to readings',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),


      ],
    ),
    ))));
  }

  reading({required String header,
    required String value,
    required String script}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header, // Label
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value, // Main value (e.g., 48)
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(1, 4),
                      child: Text(
                        script, // Subscript text
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}