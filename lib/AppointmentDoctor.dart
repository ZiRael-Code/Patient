import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(AppointmentDoctor());
}
class AppointmentDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: AppointmentDoctorPage(),
      ),
    );
  }
}

class AppointmentDoctorPage extends StatelessWidget {
  const AppointmentDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 206,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Colors.blue,
            ),
              alignment: Alignment.centerLeft,
              child:
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 45,
                height: 45,
                alignment: Alignment.center, // Centers the content inside the inner container
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFE5E5E5).withOpacity(0.15),
                ),
                child: SvgPicture.asset(
                  'assets/images/back.svg',
                  color: Colors.white,
                  width: 8.0,
                  height: 15,
                ),
              ),
            ),
          Column(
            children: [
              SizedBox(height: 150),
              Align(
                    child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dr.png'),
                        radius: 50
                        ),

              ),
              SizedBox(height: 20),
              Text(
                'Dr. Nelson Yang',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Cardiovascular surgeon',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  handles(handleIconPath: 'assets/images/tel.svg'),
                  handles(handleIconPath: 'assets/images/contactMe.svg'),
                  handles(handleIconPath: 'assets/images/vc.svg'),
                ],
          ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding:EdgeInsets.only(left: 15, right: 15),
                child:
                Column(
                  children: [
                  Align(
                alignment: Alignment.centerLeft,
                child:Text('Avialable days', textAlign: TextAlign.left,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),

              ),
                    SizedBox(height: 7,),
                    Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    direction: Axis.horizontal,
                  children: [
                  wicd(text: "MON"),
                  wicd(text: "TUE"),
                  wicd(text: "WED"),
                  wicd(text: "THUR"),
                ],
              ),
              ),

                SizedBox(height: 20,),
                Align(
                alignment: Alignment.centerLeft,
                child:Text('Avialable days', textAlign: TextAlign.left,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),

              ),
                    SizedBox(height: 7,),
                    Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    direction: Axis.horizontal,
                  children: [
                  wicd(text: "11:00AM-3:00AM"),
                  wicd(text: "9:00AM"),
                  wicd(text: "7:00PM"),
                ],
              ),
              ),
                    SizedBox(height: 15,),
                Align(
                  alignment: Alignment.centerLeft,
                 child:
                   Text('Patient Reviews',
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                     child: Text('N20,000',
                      style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),),
                ),
                     SizedBox(height: 10,),
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
                        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                        child: Text(
                          'Book an appointment',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
    ],
    ),
    )
   ],
          ),
        ]
        ,)
    );
  }


  patientReview({
   required int reviewedStar,
    required String dateReviewed,
    required String review,
    required String reviewerName,
    required BuildContext context
}){
return Container(
  padding: EdgeInsets.all(12),
  // height: 167,
width: MediaQuery.of(context).size.width * 0.8,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(9),
border: Border.all(
color: Colors.black.withOpacity(0.1),
width: 1.5,
),
),
  child: Column(
    children: [
      Align(
        alignment: Alignment.topCenter,
        child:
      Row(
        children: [
          Image.asset('assets/images/dr_profile.png', width: 50, height: 50,),
          SizedBox(width:10),
          // CircleAvatar(
          //   backgroundImage: AssetImage(),
          //   radius: 50,
          // ),
          Column(
            children: [
              Text(reviewerName, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
              SizedBox(height: 3,),
          RatingBar(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: Colors.amber),
            half: Icon(Icons.star_half, color: Colors.amber),
            empty: Icon(Icons.star_border, color: Color(0xFFC7C7C7)),
          ), onRatingUpdate: (double value) {  },
            itemSize: 18,
          ),

    ],
          ),
          Spacer(),
          Container(alignment: Alignment.topLeft,
            child:
          Text(dateReviewed,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 15
          ),),
          ),
        ],
      ),
      ),
      SizedBox(height: 10,),
      Container(
        width: MediaQuery.of(context).size.width *  0.8,
        // width: 265,
        child:
      Text(review, style: TextStyle(fontSize: 14),),
      ),
    ],
  ),
);
}


  wicd({
    required String text
}){
    return Container(
      margin: EdgeInsets.only(right: 5, top: 15),
      padding: EdgeInsets.only(top: 12, left: 25, bottom: 12, right:25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.5),
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Text(text, style: TextStyle(fontSize: 12),),
    );
  }

  handles({
    required handleIconPath
}){
    return Container(
      child: SvgPicture.asset(handleIconPath),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.blue.withOpacity(0.15),
      ),
      padding: EdgeInsets.all(10),
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 10),
    );
}
}
