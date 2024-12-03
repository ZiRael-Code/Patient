import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(Appointments());
}

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppointmentsState(),
    );
  }
}

class AppointmentsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Appointments',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Icon(Icons.message, size: 28),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appointment text and message icon with red dot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                ],
              ),
              SizedBox(height: 60),

              // Image
              Center( child:
              SvgPicture.asset(
                  'assets/images/calender.svg',
              ),
              ),
              SizedBox(height: 30),

              // Descriptive Text
              Center(
                child: Text(
                  'If you want to book a physical or an online meeting with your specialist, you can do it here.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 25),

              // Book Appointment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                   fixedSize: Size.fromHeight(54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    child: Text(
                      'Book an appointment',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),

              // Pending Appointments Text
                Text(
                  'Pending Appointments',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 20),
              // Container with dashed border and semi-transparent background
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 128,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dr. Nelson Yang", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("9:00AM . 12th June 2022"),
                            Container(
                              margin: EdgeInsets.only(top: 10, left: 5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0x262DB042).withOpacity(0.35)
                              ),
                              child: Text("Online Appointment"),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color:  Colors.black.withOpacity(0.1)),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}