import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ApplyForLoan.dart';
import 'package:flutter_app/Checkout.dart';
import 'package:flutter_app/LoanCheckout.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(RequestNewDeviceLoan());
}

class RequestNewDeviceLoan extends StatefulWidget {
  const RequestNewDeviceLoan({super.key});
  @override
  _RequestNewDeviceScreen createState() => _RequestNewDeviceScreen();
}

class _RequestNewDeviceScreen extends  State<RequestNewDeviceLoan> {
  String? _selectedValue;
  List<int> _cartIncrease = [];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
   _cartIncrease = List.generate(100, (index) => 0);
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
        Container(
          width: 180,
          child: Text(textAlign: TextAlign.center,'Request for a new device',style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 25,),
        Container(
          width: 284,
          child: Text(textAlign: TextAlign.center,'Select which device(s) you want to order',style: TextStyle(fontSize: 14,),),
        ),

        SizedBox(height: 45,),

        device(
          name: "Wellue BP2 connect device ",
          price: "N25,000",
          message: "Blood pressure, heart rate, body temperature, oxygen saturation, blood glucose, lipids "
          ,index: 0
        ),
        device(
          name: "Wellue BP2 connect device ",
          price: "N25,000",
          message: "Blood pressure, heart rate, body temperature, oxygen saturation, blood glucose, lipids "
          ,index: 1
        ),

        SizedBox(height: 25,),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> LoanCheckout()));
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
        SizedBox(height: 10,),
      ],
    ),
    ))));
  }

  device({
    required String name,
    required String price,
    required String message,
    required int index
  }) {
    return
      Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 0.5, color: Colors.black54),
      ),
      child:Stack(
        children: [
          _cartIncrease[index] > 0 ?
          Positioned(
            top: 0,
            right: 0,
            child:
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              child: Icon(Icons.check, color: Colors.white,),
            ),
          )
              :
          Container(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontSize: 16, ),),
              SizedBox(height: 10,),
              Text(price, style: TextStyle(fontSize: 16, color: Colors.blue),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 183,
                    child:
                  Text(message, style: TextStyle(fontSize: 12, color: Colors.black54),)
    )
                ],
              ),
                  SizedBox(height: 14,),
                  Container(
                    width: 102,
                    padding: EdgeInsets.only(left: 14, right: 14, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 0.5, color: Colors.black54),
                    ),
                    child: Row(
                        children: [
                          GestureDetector(
                            child: Container(
                              // padding: EdgeInsets.all(4),
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xffE2EDFF)
                              ),
                              child: Icon(Icons.minimize,size: 11 ,color: Colors.blue),
                            ),
                            onTap: () {
                              setState(() {
                                _cartIncrease[index] = _cartIncrease[index]-1;
                              });
                            },
                          ),

                   Spacer(),
                   Text(_cartIncrease[index].toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                   Spacer(),
                          GestureDetector(
                            child:
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                                color: Color(0xffE2EDFF)
                            ),
                            child: Icon(Icons.add, size: 11, color: Colors.blue,),
                          ),
                            onTap: () {
                              setState(() {
                                _cartIncrease[index] = _cartIncrease[index]+1;
                              });
                            },
                          )

                        ],
                    )


                  )


            ],
          ),
          SizedBox(width: 15,),

                               Container(
                    padding: EdgeInsets.all(12),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffD9D9D9),
                    ),
                    child:  SvgPicture.asset('assets/images/dev.svg'),
                  )


        ],
      ),
      ]
    )
    );
  }

}