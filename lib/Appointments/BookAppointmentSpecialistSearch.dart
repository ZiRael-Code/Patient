import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Appointments/AppointmentDoctor.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(BookAppointmentSpecialistSearch());
}

class BookAppointmentSpecialistSearch extends StatefulWidget {
  const BookAppointmentSpecialistSearch({super.key});
  @override
  _BookAppointmentSpecialistSearchScreen createState() => _BookAppointmentSpecialistSearchScreen();
}

class _BookAppointmentSpecialistSearchScreen extends  State<BookAppointmentSpecialistSearch> {
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
                  'Appointment Specialist',
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
        body: SingleChildScrollView(
    child:
        Container(
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 30),
        Row(
          children:[
        Container(
          padding: EdgeInsets.only(right: 10),
          width: MediaQuery.of(context).size.width * 0.70,
          decoration: BoxDecoration(
             color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by name, specialization...',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),

          Container(
            margin: EdgeInsets.only(left: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/images/filter.svg'),
          )
        ]
      ),
        SizedBox(height: 40),
        Text(
          'Click on any of the profiles to book an appointment or search for a particular specialist.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black
          ),
        ),
        SizedBox(height: 45),
        //
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),

        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),

        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),

        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingDays: "MON - FRI",
          workingHours: "9:00 AM - 6:00 PM",

        ),


      ],
    ),
    ),
    )));
  }

  specialist({required String image,
    required String name,
    required String specialization,
    required String workingDays,
    required String workingHours})
  {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentDoctor()));
      },
        child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 50),
                  height: 44,
                  width: 44,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(image),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  Text(specialization, style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.withOpacity(0.90)
                  ),),
                  SizedBox(height: 20),
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
                        SizedBox(width: 10,),

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
              )

            ],
          ),
          SizedBox(height: 15,),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 15,),
        ],
      ),
      ),
    );
  }
}