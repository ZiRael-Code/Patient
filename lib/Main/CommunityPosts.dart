import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/CommunityPostComment.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(CommunityFeed());
}

class CommunityFeed extends StatefulWidget {
  const CommunityFeed({super.key});
  @override
  _CommunityPostsScreen createState() => _CommunityPostsScreen();
}

class _CommunityPostsScreen extends  State<CommunityFeed> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFFFFFFF).withOpacity(0.15),
                ),
                child: SvgPicture.asset('assets/images/back.svg',
                  width: 8.0,
                  height: 15,
                color: Colors.white,),
              ),
              Spacer(),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFFFFFFF).withOpacity(0.15),
            ),
            child: Icon(Icons.more_vert, color: Colors.white,)
          ),

            ],
          ),
          centerTitle: true,
        ),
        body:
        Container(
          decoration: BoxDecoration(color: Colors.white),
            // padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [

        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          alignment: Alignment.bottomCenter,
                          height: 145,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(width: 0.1),
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
                                'Diabetes patients community',
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
                                    '15 members',
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
                                    'surulere lagos',
                                    style: TextStyle(fontSize: 16, color: Color(0xff666666)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(children: [
                        // SizedBox(height: 45,),
                        Align(
                          alignment: Alignment.topCenter,
                          child:  SizedBox(
                            width: 77,
                            height: 77,
                            child:
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/family.png'),
                            ),
                          ),
                        ),
                      ]
                      ),
                    ]
                )
            )
          ],
        ),

            SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(12),
         child:  Row(
        children: [
        // Left Text: "Community Feed" (Bold, Size 18)
        Text(
        'Community Feed',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(), // Adds space between the two texts
        // Right Text: "Post something" (Blue, Size 14)
        Text(
          'Post something',
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue,
          ),
        ),
          ],
        ),
        ),
        SizedBox(height: 20,),


            Expanded(child:
            SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
        Container(
          padding: EdgeInsets.all(3),
          child: 
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xffe5e5e5),
            border: Border.all(width: 1, color: Color(0xffe5e5e5))
          ),
          child: Column(
            children: [

              post(
                iconPath: "assets/images/doc1.png",
                name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept 2022",
                post: "Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.",
                comments: "15"
              ),

              post(
                iconPath: "assets/images/doc1.png",
                name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept 2022",
                post: "Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.",
                comments: "15"
              ),

              post(
                iconPath: "assets/images/doc1.png",
                name: "Rayoo Rayoo",
                time: "11:20am",
                date: "9th Sept 2022",
                post: "Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.",
                comments: "15"
              ),

            ],
          ),
          ),
          ),
      )
      )
          ]
        )

    ))));
  }

  post({
    required String iconPath,
    required String name,
    required String time,
    required String date,
    required String post,
    required String comments
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> CommunityPostComment()));
      },
        child: Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
              width: 42,
              height: 42,
            child: CircleAvatar(
                radius: 50,
              backgroundImage: AssetImage(iconPath),
              ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 14),),
                  Text(time+" . "+date, style: TextStyle(color: Colors.black45))
                ],
              ),
              Spacer(),
              Icon(Icons.more_vert, color: Colors.black,)
            ],
          ),
          SizedBox(height: 20,),
          Container(
            width: 285,
            child: Text(post, style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 20,),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.comment, color: Colors.black,),
              SizedBox(width: 5,),
              Text(comments+" comments", style: TextStyle(color: Colors.black)),
            ],
          )
        ],
      ),
      ),
    );
  }
}