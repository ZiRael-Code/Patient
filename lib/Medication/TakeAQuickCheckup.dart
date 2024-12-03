import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Medication/SearchSpecialist.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(TakeAQuickCheckup());
}

class TakeAQuickCheckup extends StatefulWidget {
  const TakeAQuickCheckup({super.key});
  @override
  _TakeAQuickSessionScreen createState() => _TakeAQuickSessionScreen();
}

class _TakeAQuickSessionScreen extends  State<TakeAQuickCheckup> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Take a quick checkup',
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
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          width: double.infinity,
          child:  Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: 1, 
                  color: Colors.black.withOpacity(0.090))
            ),
              child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchSpecialist()));
          },
                child:
              Container(
                width: 59,
                height: 59,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE2EDFF),
                ),
                child: Icon(Icons.search, weight: 6, size: 38,
                  color: Colors.blue,),
              ),
              ),

              SizedBox(width: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.58,
                child: Text('Search for doctors/hospitals/pharmacies by their names.')
              )

        ]
      )
      ),
        ),
        SizedBox(height: 20,),
        Container(
          alignment: Alignment.centerLeft,
          child: Text('Affiliated medical personnels', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

        ),
        SizedBox(height: 35,),
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. Nelson Yang",
          specialization: "Design Doctor",
          workingType: "Walls and Gates hospital",
        ),

        specialist(
          image: "assets/images/doc1.png",
          name: "Dr. Muiz Sanni",
          specialization: "Design Doctor",
          workingType: "Walls and Gates hospital",
        ),
        specialist(
          image: "assets/images/host2.png",
          name: "New Life Medical Hospital Centre",
          specialization: "Hospital",
          workingType: "",
        ),

        specialist(
          image: "assets/images/pharm2.jpeg",
          name: "RX Pharmacy",
          specialization: "Pharmacy",
          workingType: "",
        ),

      ],
    ),
    )));
  }

  specialist({required String image,
    required String name,
    required String specialization,
    required String workingType})
  {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  // margin: EdgeInsets.only(bottom: 50),
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
                  Text("${specialization} . ${workingType}", style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(0.90)
                  ),),
                ],
              )

            ],
          ),
          SizedBox(height: 15,),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 15,),
        ],
      ),
    );
  }



}