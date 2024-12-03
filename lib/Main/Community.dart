import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/AllCommunity.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(Community());
}

class Community extends StatefulWidget {
  const Community({super.key});
  @override
  _CommunityScreen createState() => _CommunityScreen();
}

class _CommunityScreen extends  State<Community> {
  String? _selectedValue;
  bool isSelected = true;
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
                  'Community',
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
          width: 258,
          child:
        Align(child: Text("Welcome to the community page!", textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        ),
        ),
        ),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.center,
          width: 304,
          child:
        Align(child: Text("This is where you can interact with doctors and other patients that have the same conditions as you do to ask questions and give your own observations.", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
        ),
        ),
        ),
        ),
        SizedBox(height: 50,),
        SvgPicture.asset('assets/images/community.svg'),


        Spacer(),

        ElevatedButton(
          onPressed: () {
            anomymity();
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
              'Explore community',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    ),
    )));
  }

  anomymity(){
    bool isChecked = false;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Anonymity', style: TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              Text(textAlign: TextAlign.center ,'You can choose to not disclose your identity while asking questions on the community.', style: TextStyle(color: Color(0xff666666)),),
              SizedBox(height: 25,),
              Text('Set display name'),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  hintText: 'e.g Lagbaja',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0, // Height of 50 (including padding)
                    horizontal: 10.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isSelected =!isSelected;
                      });
                    },
                    child:
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.green : Color(0xffF2F2F2),
                      ),
                      child: Icon(Icons.check, color: isSelected ? Colors.white : Color(0xffC2C2C2))
                  ),
                  ),
                  SizedBox(width: 7,),
                  Text('Always use this display name'),

          ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> AllCommunity()));
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
                    'Okay',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
          ]),
        );
      },
    );
  }
}