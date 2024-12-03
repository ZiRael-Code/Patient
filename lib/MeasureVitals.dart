import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MeasureVitals());
}

class MeasureVitals extends StatefulWidget{
  @override
  _MeasureVitalsState createState() => _MeasureVitalsState();
}

class _MeasureVitalsState  extends State<MeasureVitals>{
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
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  width: 8.0,
                  height: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 35),
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Measure vital',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Heart Rate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              SvgPicture.asset('assets/images/cuate.svg'),
              SizedBox(height: 20),
              Text(
                'You don’t have any device yet',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 215,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Order a device',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recommended devices',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      recomendDevice(
                        name: "Wellue BP2 Connect Device",
                        measures: "Measures 1 vital",
                        image: "assets/images/printer.svg",
                        prices: "N25,000",
                      ),
                      SizedBox(height: 15),
                      recomendDevice(
                        name: "Wellue BP2 Connect Device",
                        measures: "Measures 3 vitals",
                        image: "assets/images/printer.svg",
                        prices: "N25,000",
                      ),
                      SizedBox(height: 15),
                      recomendDevice(
                        name: "Wellue BP2 Connect Device",
                        measures: "Measures 1 vital",
                        image: "assets/images/printer.svg",
                        prices: "N25,000",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  recomendDevice({
    required String name,
    required String measures,
    required String image,
    required String prices,
  }) {
    return Container(
      padding: EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(measures),
                ),
                SizedBox(height: 8),
                Text(
                  prices,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 134,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Order Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.34),
              borderRadius: BorderRadius.circular(50),
            ),
            child: SvgPicture.asset(image),
          ),
        ],
      ),
    );
  }
}
