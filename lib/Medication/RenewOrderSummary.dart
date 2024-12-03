import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Medication/RenewOrderTotalPrice.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(RenewOrderSummary());
}

class RenewOrderSummary extends StatefulWidget {
  const RenewOrderSummary({super.key});
  @override
  _RenewOrderSummaryScreen createState() => _RenewOrderSummaryScreen();
}

class _RenewOrderSummaryScreen extends  State<RenewOrderSummary> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  'Renew order',
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

SizedBox(height: 30,),
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
          SizedBox(height: 35,),
          drug(
            price: 'N650',
              name: "Ibuprofen",
              usage: '1 pack: 1 pill(s). 2x daily'
          ),
          drug(
            price: 'N1,500',
              name: "Cough syrup",
              usage: '1 bottle:  10ml. 3X daily'
          ),
          drug(
              price: 'N3,250',
          name: "Paracetamol",
          usage: '1 pack:  3 pill(s) . 3X daily'
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RenewOrderTotalPrice()));
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
    required String price,
    required String name,
    required String usage}) {
    return Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
          width: 0.7,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
             Spacer(),
              Text(price, style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold))
            ],
          ),
          
          SizedBox(height: 8,),
          Text(usage, style: TextStyle(color: Color(0xff666666)))
        ],
      ),
    );
  }

  prescription_information_bottom_sheet(){
    return Column(
      children: [
        Container(
          width: 197,
          child: Text('Have you gotten these drugs yet?', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 15,),
        Container(
        width: 197,
        child: Text('Once you click the ‘start using drugs’ button, a counter starts counting the number of drugs you’ve used. Click yes if you’ve gotten them.')
        ),
        SizedBox(height: 15,),
        Row(
          children: [

          ],
        )
    ],
    );
  }
}