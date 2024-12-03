import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/AppointmentPaymentSuccess.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(){
  runApp(AppointmentPaymentSummary());
}

class AppointmentPaymentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        centerTitle: true,
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
            Container(
              margin: EdgeInsets.only(left: 35),
              alignment: Alignment.center,
              child:
              Center(child: Text(
                'Summary',
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
            ),
          ],
        )
    ),
          backgroundColor: Colors.white,
          body: AppointmentPaymentAppointmentPaymentSummaryState(),
    );
  }
}

class AppointmentPaymentAppointmentPaymentSummaryState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 40),
      child: Column(
      children: [
        SizedBox(height:30),
        Container(
          padding: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width,
          height: 103,
          child: Row(
            children: [
              Image.asset('assets/images/dr_profile.png',
              width: 56,
              height: 56,
              ),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Dr. Muiz Sanni", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              Center(child: Text("Cardiovascular surgeon", style: TextStyle(color: Colors.grey),),),
            ],
          ),
          ],
        ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color:  Colors.black.withOpacity(0.1)),
          ),
        ),
        SizedBox(height: 20,),
        Container(

          height: 56,
          width: 180,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center( child: Text("FEE: ", style: TextStyle(color: Colors.black),),),Center( child: Text("N25,000", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),),]),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color:  Colors.black.withOpacity(0.1)),
          ),
        ),
        SizedBox(height: 10,),
        Wrap(
          direction: Axis.horizontal,
          children: [
            Row(
              children: [
                Text("Time:"),
                Spacer(),
                Text("12:00pm"),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Date:"),
                Spacer(),
                Text("12th July 2022"),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Appointment type:"),
                Spacer(),
                Text("Online"),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Consultation fee:"),
                Spacer(),
                Text("N25,000.00"),
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12),

          child: Row(
            children: [
              SvgPicture.asset("assets/images/notify.svg"),
              Container(
                  width: 250,
                  child:
              Text("A request for an appointment will first be sent to a doctor to confirm his availability.", softWrap: true,)
              ),
                ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Color(0xFFF2F2F2),
          ),
        ),

        Spacer(),
        SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentPaymentSuccess()));
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
              'Continue  to schedule appointment',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ],
    ),
    );
  }
}