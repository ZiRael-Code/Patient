import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(OrderDeatils());
}

class OrderDeatils extends StatefulWidget {
  const OrderDeatils({super.key});
  @override
  _OrderDeatilsScreen createState() => _OrderDeatilsScreen();
}

class _OrderDeatilsScreen extends  State<OrderDeatils> {
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
                  'Order details',
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
        // Container(
        //   alignment: Alignment.center,
        //   width: MediaQuery.of(context).size.width * 0.78,
        //   child:
        // Align(child: Text("Your drugs are being processed by the pharmacy. When you’ve recieved them, click on the button below to start using them.", textAlign: TextAlign.center,
        // style: TextStyle(
        //   fontSize: 14,
        // ),
        // ),
        // ),
        // ),
        // SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.070),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/images/pill1.svg'),
              SizedBox(width: 8),
              Text(
                '12/06/2022 - ',
                style: TextStyle(
                  color: Color(0xff218130),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Prescriptions',
                style: TextStyle(
                  color: Color(0xff218130),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30,),

        drug(
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily',
            price: "N25,000"

          ),
          drug(
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily',
              price: "N25,000"

        ),
        drug(
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily',
              price: "N25,000"

        ),
        SizedBox(height: 40),
        info(
            type: 'Name',
            des: '12/06/2022-Prescription'
        ),
        info(
            type: 'Prescribed by:',
            des: 'Dr. Muiz Sanni'
        ),
        info(
            type: 'Date',
            des: '12/06/2022-Prescription'
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            cancel_dialog();
          },
          style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.blue,
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
              side: BorderSide(color: Colors.red, width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Continue',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
        ),

      ],
    ),
    )));
  }
  info({
    required String type,
    required String des}) {
    return Column(
        children: [
          Row(
            children: [
              Text(type, style: TextStyle(fontSize: 14, color: Color(0xff666666))),
              Spacer(),
              Text(des, style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 12),
        ]
    );
  }
  drug({
    required String name,
    required String usage,
    required String price,

  }) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyle(fontSize: 16),),
          SizedBox(height: 8,),
          Text(usage, style: TextStyle(color: Color(0xff666666)))
        ],
      ),
    Text(price, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),)
    ],
      ),
    );
  }


  cancel_dialog(){
    showDialog(
        context: context,
        builder: (context)
    {
      return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
          width: 201,
              child:
              Text(textAlign: TextAlign.center, 'Are you sure you want to cancel this order?', style: TextStyle(fontSize: 16),),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      cancel_dialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: () {
                      cancel_dialog();
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                        side: BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
                ],
          )
      );
    }
    );
  }
}