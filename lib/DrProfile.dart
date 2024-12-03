import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(DrProfile());
}
class DrProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: DrProfileState(),
      ),
    );
  }
}

class DrProfileState extends StatelessWidget {
  const DrProfileState({super.key});

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
                        backgroundImage: AssetImage('assets/images/dr_profile.png'),
                        radius: 50
                        ),

              ),
              SizedBox(height: 20),
              Text(
                'Dr. Muiz Sanni',
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
                  handles(handleIconPath: 'assets/images/drAppoint.svg'),
                  handles(handleIconPath: 'assets/images/location.svg'),
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
                child:Text('About', textAlign: TextAlign.left,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),

              ),
                    SizedBox(height: 7,),
                    Text("Dr Sanni Muiz is a well versed cardiovascular surgeon with over 10 years experience in the field. He graduated with a first class honors from the University of Chicago in 1990 ... read more",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  SizedBox(height: 15,),
                  Align(
                  alignment: Alignment.centerLeft,
                //   child: Row(
                // children: [
                  child: Wrap(
                    direction: Axis.horizontal,
                  children: [
                  wicd(text: "MBBS"),
                  wicd(text: "CONSULTANT"),
                  wicd(text: "MIA"),
                  wicd(text: "MRC (UK)"),
                  wicd(text: "FCPS (PAKI)"),
                ],
              ),
              ),
                    SizedBox(height: 15,),
                Align(
                  alignment: Alignment.centerLeft,
                 child:
                 Column(
                   children: [
                   Text('Patient Reviews',
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                     SizedBox(height: 10,),
                ],
                ),

                ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child:SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                    Row(
                      children: [
                        patientReview(
                            reviewedStar: 4,
                            dateReviewed: '23 July 2023',
                            review: 'I’m really thankful to doctor Sanni for this wonderful treatment. I feel better thanks to his prescriptions and he’s really nice.',
                            reviewerName: 'Richard Okafor',
                            context: context
                        ),
                        SizedBox(width: 20,),
                        patientReview(
                            reviewedStar: 4,
                            dateReviewed: '23 July 2023',
                            review: 'I’m really thankful to doctor Sanni for this wonderful treatment. I feel better thanks to his prescriptions and he’s really nice.',
                            reviewerName: 'Richard Okafor',
                            context: context
                        ),

                      ],
                    ),
                    ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Align(alignment: Alignment.topLeft,child:
                        Text('Write a Review', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),),],),
                    SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xFFF1F1F1),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: 1.5,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                    child: 
                    Column(
                      children: [
                        RatingBar(
                          initialRating: 0,
                          minRating: 0,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.amber),
                            half: Icon(Icons.star_half, color: Colors.amber),
                            empty: Icon(Icons.star_border, color: Color(0xFFC7C7C7)),
                          ), onRatingUpdate: (double value) {  },
                          itemSize: 34,
                        ),
                        Text('Slide accross to leave a rating',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                    ),
                  ),
                    SizedBox(height: 20,),

                Container(
                  height: 49,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'Add your name here',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16, // Font size of the input text
                    ),
                  ),
                ),
              SizedBox(height: 20,),
                Container(
                  height: 138,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      hintText: 'Write your review here',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                    SizedBox(height: 20,),



                    Align(
                      alignment: Alignment.bottomCenter,
                      child:
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
                          'Request to be a patient',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
              ),
                    SizedBox(height: 20,),
                ],
                ),
              ),

        ],

      ),
    ],
    ),
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
      margin: EdgeInsets.only(right: 7, top: 15),
      padding: EdgeInsets.only(top: 12, left: 29, bottom: 12, right:29),
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

request_to_be_a_patient(){
    return Column(
      children: [
        SvgPicture.asset('assets/image/donearrow.svg'),
        Text('Request sent to Dr. Muiz. When they agrees to be your physician, you will be notified', textAlign: TextAlign.center,),
        SizedBox(height: 15,),
        SizedBox(
          width: double.infinity,
          child:
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'Ok, got it',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        ),

      ],
    );
}
}
