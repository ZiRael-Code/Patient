import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main() {
  runApp(OrderInformationDrug());
}

class OrderInformationDrug extends StatefulWidget {
  const OrderInformationDrug({super.key});

  @override
  _OrderInformationDrugScreen createState() => _OrderInformationDrugScreen();
}

class _OrderInformationDrugScreen extends State<OrderInformationDrug> {
  String? _selectedValue;
  bool isFilterOpen = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Order information',
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
          child: Align(
            child: Column(
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
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFilterOpen = !isFilterOpen; // Toggle the dropdown and icon
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          color: Color(0xFFE2EDFF),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              'See details',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3C8AFF),
                              ),
                            ),
                            SizedBox(width: 15),
                            Icon(
                              isFilterOpen
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.blue,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                      if (isFilterOpen)
                        Container(
                          margin: EdgeInsets.only(top: 16), // Spacing between row and dropdown
                          width: double.infinity, // Matches screen width
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('No. of medications:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.55),
                                  )
                                  ),
                                  Spacer(),
                                  Text('3 drugs',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )
                                  )
                                ],
                              ),
  SizedBox(height: 25,),
                              Row(
                                children: [
                                  Text('Price:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.55),
                                  )
                                  ),
                                  Spacer(),
                                  Text('N25,000.00',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                  )
                                  )
                                ],
                              ),
                              SizedBox(height: 25,),
                              Row(
                                children: [
                                  Text('TOTAL:',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.55),
                                  )
                                  ),
                                  Spacer(),
                                  Text('N5,500.00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Proceed to checkout',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
