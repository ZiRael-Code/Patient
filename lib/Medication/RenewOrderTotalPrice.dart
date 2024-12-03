import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/BuyDrugCheckout.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(RenewOrderTotalPrice());
}

class RenewOrderTotalPrice extends StatefulWidget {
  const RenewOrderTotalPrice({super.key});
  @override
  _RenewOrderCheckoutScreen createState() => _RenewOrderCheckoutScreen();
}

class _RenewOrderCheckoutScreen extends  State<RenewOrderTotalPrice> {
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

        SizedBox(height: 25),
        GestureDetector(
          child: 
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.40,
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xffE2EDFF),
            ),
            child: GestureDetector(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('See details', style: TextStyle(color: Colors.blue),),
                SizedBox(width: 10,),
                Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
              ],
          ),
              onTap: (){
                prescription_information_bottom_sheet();
              },
          )
        ),
        ),
        ),
        SizedBox(height: 20,),
        
        Row(
          children: [
            Text('No. of medications:', style: TextStyle(color: Color(0xff666666))),
            Spacer(),
            Text('3 drugs'),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('price', style: TextStyle(color: Color(0xff666666))),
            Spacer(),
            Text('N5,350.00', style: TextStyle(color: Colors.blue),
            )],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('TOTAL', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Text('3 drugs', style: TextStyle(fontSize: 16,color: Colors.blue),
            )],
        ),

        
        
        Spacer(),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Checkout()));
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
              'Proceed to checkout',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    )));
    
  }

  prescription_information_bottom_sheet(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Prescription information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ,SizedBox(height: 25,),
              drug(
                  name: 'Ibuprofen',
                  price: 'N700',
                  qty: '1 pack'
              ),
              drug(
                  name: 'Cough syrup',
                  price: 'N700',
                  qty: '1 bottle'
              ),
              drug(
                  name: 'Paracetamol',
                  price: 'N700',
                  qty: '1 pack'
              ),
              SizedBox(height: 25,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                      side: BorderSide(width: 1, color: Colors.blue)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'Close',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        );
      },
    );
  }
  drug({
    required String name,
    required String price,
    required String qty,
  }){
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
      child:
        Row(
          children: [
            Column(children: [
              Text(name),
              SizedBox(height: 10),
              Text(qty,style: TextStyle(color:  Color(0xff666666)))
              ,SizedBox(height:15),
            ],),
            Spacer(),
            Text(price, style: TextStyle(color: Colors.blue, fontSize: 16),),
          ],
        ),

    );
  }
}