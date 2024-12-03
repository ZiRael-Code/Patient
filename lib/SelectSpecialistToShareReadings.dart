import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(SelectSpecialistToShareReadings());
}

class SelectSpecialistToShareReadings extends StatefulWidget {
  const SelectSpecialistToShareReadings({super.key});
  @override
  _SelectSpecialistToShareReadingsScreen createState() => _SelectSpecialistToShareReadingsScreen();
}

class _SelectSpecialistToShareReadingsScreen extends  State<SelectSpecialistToShareReadings> {
  String? _selectedValue;

  List<bool> isSelectedList = [];



  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(1000, false);
  }
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
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                child:
                Center(child: Text(
                  'Share readings',
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
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.78,
          child:
        Align(child: Text("Select the medical personnel(s) you want to share your vital readings with", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),
        SizedBox(height: 35,),
        specialist(
            image: "assets/images/doc1.png",
            name: "Dr. John Doe",
            specialization: "Cardiologist surgeon",
            workingType: "Freelance specialist",
            index: 0
        ),
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingType: "Freelance specialist",
            index: 1
        ),
        specialist(
          image: "assets/images/doc.png",
          name: "Dr. Nelson Yang",
          specialization: "Design Doctor",
          workingType: "Walls and Gates hospital",
            index: 2
        ),
        specialist(
          image: "assets/images/doc1.png",
          name: "Dr. John Doe",
          specialization: "Cardiologist surgeon",
          workingType: "Freelance specialist",
          index: 3
        ),

        SizedBox(height: 25,),

        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.60,
          decoration: BoxDecoration(
            color: Color(0xFFE2EDFF),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: Text(
              'Sharing options',
              style: TextStyle(
                color: Color(0xFF3C8AFF),
              ),
            ),
            isExpanded: true,
            underline: SizedBox(),
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF3C8AFF),
            ),
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.blue,),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
            items: <String>['Sharing 1 week readings', 'Sharing 2 week readings', 'Sharing 3 week readings', 'Sharing 4 week readings']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        Spacer(),
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
              'Share readings',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),


      ],
    ),
    ))));
  }

  specialist({required String image,
    required String name,
    required String specialization,
    required int index,
    required String workingType})
  {
    return GestureDetector(
      child: Container(
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
                      color: Colors.black
                  ),),
                  SizedBox(height: 5,),
                  Text("${specialization} . ${workingType}", style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(0.90)
                  ),),
                ],
              ),
              Spacer(),
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelectedList[index] ? Colors.green : Color(0xffF2F2F2),
                ),
                child: isSelectedList[index]
                    ? Icon(Icons.check, color: isSelectedList[index] ? Colors.white : Color(0xffC2C2C2))
                    : Container(),
              ),
            ],
          ),
          SizedBox(height: 15,),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 15,),
        ],
      ),
    ),
      onTap: (){
        setState(() {
          isSelectedList[index] =!isSelectedList[index];
        });
      },
    );
  }



}