import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(MainAppointment());
}


class MainAppointment extends StatefulWidget{
  @override
  _MainAppointmentState createState() => _MainAppointmentState();
}

class _MainAppointmentState extends State<MainAppointment> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'MainAppointment',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.black,
                  size: 28,
                ),
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 12,
                child: Container(
                  width: 10,
                  height: 10,
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
      body:SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            // Scrollable row with quick checkup options
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  appointmentOptions(
                    icon: Icon(
                      Icons.electric_bolt,
                      color: Colors.blue,
                      size: 30,
                    ),
                    text: "Take a quick checkup"
                  ),

                  appointmentOptions(
                    icon: Icon(
                      Icons.local_hospital,
                      color: Colors.blue,
                      size: 30,
                    ),
                    text: "Book appointment"
                  ),


                  appointmentOptions(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.blue,
                      size: 30,
                    ),
                    text: "Schedule appointment"
                  ),

                  appointmentOptions(
                    icon: Icon(
                      Icons.share,
                      color: Colors.blue,
                      size: 30,
                    ),
                    text: 'View affiliated network',
                  ),
                  // Add more options here as needed...
                ],
              ),
            ),
            SizedBox(height: 20),

            // Available specialists with "See more" button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available specialists',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),

            // Scrollable row of specialists
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [

                  specialist(
                    ratings: "3.5",
                    imagePath: "assets/images/doc.png",
                    name: "Dr. Patric Ayomide",
                    specialization: "Cardiologist surgeon",
                    workingDays: "MON - FRI",
                    workingHours: "9:00 AM - 6:00 PM",
                  ),

                  specialist(
                    ratings: "3.5",
                    imagePath: "assets/images/doc.png",
                    name: "Dr. Patric Ayomide",
                    specialization: "Cardiologist surgeon",
                    workingDays: "MON - FRI",
                    workingHours: "9:00 AM - 6:00 PM",
                  ),
                  // Add more specialists here...
                ],
              ),
            ),
            SizedBox(height: 25),
            // Pending MainAppointment
            Text(
              'Pending appointments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 25),

           nothing(),

            // The design for the appointment is down uncomment this to see it.
            // appointments(name: "Dr. Nelson Yang",
            //     time: '9:00AM.',
            //     date: '12th June',
            //     appointmentType: 'online appointment'
            // ),
            //
            // appointments(name: "Dr. Charles Dickson",
            //     time: '9:00AM.',
            //     date: '12th June',
            //     appointmentType: 'Physical appointment'
            // )

          ],
        ),
      ),
      ),
    ),
    );
  }

  appointments({
    required String name,
    required String time,
    required String date,
    required String appointmentType,

  }){
    Color textColor = Color(0xffffa135);
    if (appointmentType.toLowerCase().compareTo('online appointment') == 0 ){
      textColor =  Color(0xffffa135);
    }else{
      textColor = Color(0xFF2db042);
    }
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.09))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(name, style: TextStyle(
           fontSize: 16,
           color: Colors.black,
         ),),
         SizedBox(height: 5,),
         Row(
           children: [
             Text(time, style: TextStyle(
               fontSize: 14,
               color: Colors.black,
             ),),
             SizedBox(width: 8,),
             Text(date, style: TextStyle(
               fontSize: 14,
               color: Colors.black,
             ),),
           ],
         ),
         SizedBox(height: 10,),
         Container(
           padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(50),
             color:  textColor.withOpacity(0.15)
           ),
           child:   Text(appointmentType, style: TextStyle(
             fontSize: 16,
             color: textColor,
           ),),
         ),
       

       ],
      ),
    );

  }

  appointmentOptions({
    required Icon icon,
    required String text}) {
    return Container(
      margin: EdgeInsets.only(right: 3),
      child: Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            shape: BoxShape.circle,
          ),
          child: icon
        ),
        SizedBox(height: 8),
        Container(
          width: 78,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
    );
  }

  nothing() {
    return  DottedBorder(
      color:  Colors.grey.withOpacity(0.70),
      radius: Radius.circular(19),
      dashPattern: [8, 6],
      borderType: BorderType.RRect,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 342,
        height: 206,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.10)
        ),
        child: Column(
          children: [
            SvgPicture.asset('assets/images/box.svg'),
            Text('No appointment yet.', style: TextStyle(fontSize: 16,
                color: Colors.black.withOpacity(0.40)),),
            SizedBox(height: 12,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
                    'Book an appointment',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),

            Spacer(),

          ],
        ),


      ),
    );
  }

  specialist({required String ratings,
    required String imagePath,
    required String name,
    required String specialization,
    required String workingDays,
    required String workingHours
  }) {
    return Container(
      padding: EdgeInsets.only(left: 11, right: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: Colors.black.withOpacity(0.09),
        ),
      ),
      width: 237,
      height: 286,
      margin: EdgeInsets.only(right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                child: Image.asset(imagePath),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 51,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        ratings,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            specialization,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height:10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      workingDays,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                ),

                Container(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                      color: Color(0xffE2EDFF),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      workingHours,
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )
                ),

              ]
          )
        ],
      ),
    );
  }
}
