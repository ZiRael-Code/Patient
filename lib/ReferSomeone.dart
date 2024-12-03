
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart'; // For clipboard functionality


void main(){
  runApp(ReferSomeone());
}

class ReferSomeone extends StatefulWidget {
  const ReferSomeone({super.key});
  @override
  _ReferSomeoneScreen createState() => _ReferSomeoneScreen();
}

class _ReferSomeoneScreen extends  State<ReferSomeone> {
  String? _selectedValue;
  final String referralCode = '7f44aiwuehjands3gui';
  int size = 0;
  List<String> contacts = ["Alexander Trelawney",
    "Alexander Trelawney", "Alexander Trelawney",
    "Alexander Trelawney", "Benjamin Osagie",
    "Benjamin Osagie", "Benjamin Osagie"];
  List<bool> isSelectedList = [];



  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(contacts.length, false);
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
                  'Refer someone',
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
        body: Container(
          padding: EdgeInsets.all(20),
          child: 
          Column(children: [
            SizedBox(height: 20,),


         
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Container with person icon
            Container(
              width: 49,
              height: 49,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10), 

            Text(
              'Referral link:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10), // Spacing

            Expanded( 
              child: Text(
                referralCode,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis, 
              ),
            ),

            SizedBox(width: 10), 

            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: referralCode));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Copied to clipboard'))
                );
              },
              child: Container(
                width: 79,
                height: 28,
                decoration: BoxDecoration(
                  color: Color(0xFFE2EDFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.copy, color: Colors.blue, size: 16),
                    SizedBox(width: 5),
                    Text(
                      'Copy',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
            SizedBox(height: 20,),
            SvgPicture.asset("assets/images/line.svg"),
            SizedBox(height: 20,),

         Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search contact',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),

            SizedBox(height: 20,),
            Text("[ ${size} selected ]", style: TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: 15,),

            contact(
              alphaOrder: contacts[0].toString().characters.elementAt(0),
              name: contacts[0],
              isSelected: true,
              index: 0, // You can modify this as needed
        ),

            contact(
              alphaOrder: contacts[1].characters.elementAt(0),
              name: contacts[1],
              isSelected: false,
              index: 0,
        ),
            contact(
              alphaOrder: contacts[2].characters.elementAt(0),
              name: contacts[2],
              isSelected: false,// You can modify this as needed
              index: 0,
        ),
           contact(
              alphaOrder: contacts[3].characters.elementAt(0),
              name: contacts[3],
              isSelected: true,
              index: 0,
        ),
            contact(
              alphaOrder: contacts[4].characters.elementAt(0),
              name: contacts[4],
              isSelected: false,
              index: 0,
        ),
            contact(
              alphaOrder: contacts[5].characters.elementAt(0),
              name: contacts[5],
              isSelected: false,
              index: 0,
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
              'Done',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
            ]),))

      );
  }

  Widget contact({
    required String alphaOrder,
    required String name,
    required bool isSelected,
    required int index,
  }) {
    return GestureDetector(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  color: Color(0xff2e2e42),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    alphaOrder.toUpperCase(),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffF2F2F2),
                ),
                child: isSelected
                    ? Icon(Icons.check, color: Colors.blue)
                    : Container(),
              ),
            ],
          ),
          SizedBox(height: 8),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 10),

        ],
      ),
      onTap: () {
        setState(() {
          isSelectedList[index] = !isSelectedList[index]; // Toggle selection
        });
      },
    );
  }

}