import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/CommunityPosts.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(AllCommunity());
}

class AllCommunity extends StatefulWidget {
  const AllCommunity({super.key});
  @override
  _AllCommunityScreen createState() => _AllCommunityScreen();
}

class _AllCommunityScreen extends  State<AllCommunity> {
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
                  'All communities',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                  ),
                ),
                ),
              ),
              Spacer(),
          GestureDetector(
           onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCommunity()));
             create_community_popup();
           },
            child:
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFE5E5E5),
            ),
            child: Icon(Icons.add)
          )
          )
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
        Container(
          padding: EdgeInsets.only(right: 10),
          // width: double.infinity,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: 20),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Diabetes patients community',
          communityMember: '15 members',
          communityLocation: 'Surulere, Lagos',
        ),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Hypertensive patients community',
          communityMember: '20 members',
          communityLocation: 'Surulere, Lagos',
        ),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Diabetes patients community',
          communityMember: '15 members',
          communityLocation: 'Surulere, Lagos',
        ),
        community(
            iconPath: 'assets/images/family.png',
          communityName: 'Hypertensive patients community',
          communityMember: '15 members',
          communityLocation: 'Surulere, Lagos',
        ),
      ],
    ), ),
    )));
  }

  community({
    required String iconPath,
    required String communityName,
    required String communityMember,
    required String communityLocation,
  }) {
    return Container(
      height: 229,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
        // Container(
        // height: 85,
        // // padding: EdgeInsets.all(15),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.only(topRight: Radius.circular(14), topLeft: Radius.circular(14)),
        //     color: Colors.blue,
        //   ),
        // ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
          Container(
            alignment: Alignment.bottomCenter,
            height: 145,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(14), bottomLeft: Radius.circular(14)),
                    color: Colors.white,
                  ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),

            SizedBox(height: 10),
            Text(
              communityName,
              style: TextStyle(fontSize: 18, color: Color(0xff2E2E42)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffE2EDFF)
                  ),
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                SizedBox(width: 7,),
                Text(
                  communityMember,
                  style: TextStyle(fontSize: 16, color: Color(0xff666666)),
                ),
                Spacer(),
                SvgPicture.asset('assets/images/linev.svg'),
                Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xffE2EDFF)
                  ),
                  child: Icon(Icons.location_pin, color: Colors.blue),
                ),
                SizedBox(width: 7,),
                Text(
                  communityLocation,
                  style: TextStyle(fontSize: 16, color: Color(0xff666666)),
                ),
              ],
            )
          ],
        ),
        ),
        ),
            Column(children: [
              SizedBox(height: 45,),
              Align(
                alignment: Alignment.topCenter,
                child:  SizedBox(
                  width: 77,
                  height: 77,
                  child:
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(iconPath),
                  ),
                ),
              ),
            ]
            ),
        ]
      )
      )
    );
  }

  create_community_popup(){
    return  showDialog(
        context: context,
        builder: (context) {
      return AlertDialog(
          content:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
      children: [
        Text('Create Community', style: TextStyle(fontSize: 20),),
        SizedBox(height: 25,),
        SvgPicture.asset('assets/images/wheel.svg',),
        SizedBox(height: 15,),
        Container(alignment: Alignment.center,
          width: 195,
          child: Text(textAlign: TextAlign.center, 'Do you wish to create a community?'),
        ),
        SizedBox(height: 10,),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CommunityFeed()));
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
              'Yes, continue',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        SizedBox(height: 8,),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
            side: BorderSide(color: Colors.blue, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              'No',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ),
      ],
          )
      );
        }
    );
  }
}