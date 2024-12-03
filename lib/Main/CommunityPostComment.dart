import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main(){
  runApp(CommunityPostComment());
}

class CommunityPostComment extends StatefulWidget {
  const CommunityPostComment({super.key});
  @override
  _CommunityPostCommentScreen createState() => _CommunityPostCommentScreen();
}

class _CommunityPostCommentScreen extends  State<CommunityPostComment> {
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                  'Community Post',
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
          color: Colors.white,
            padding: EdgeInsets.only(bottom: 30, left: 15, right: 15),
            child:
        Align(
          child:
      Column(
      children: [
        SizedBox(height: 30),
          Container(
            margin: EdgeInsets.only(bottom: 15),

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
                        backgroundImage: AssetImage('assets/images/doc1.png'),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rayoo Rayoo", style: TextStyle(fontSize: 14),),
                        Text("11:20am"+" . "+"9th Sept 2022", style: TextStyle(color: Colors.black45))
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_vert, color: Colors.black,)
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: 285,
                  child: Text('Is vomiting and stooling a symptom of diarrhea? Please an answer is needed as soon as possible.', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(height: 20,),
                SvgPicture.asset('assets/images/line.svg'),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('All comments', style: TextStyle(fontSize: 18)),
                    Spacer(),
                    Icon(Icons.comment, color: Colors.black54,),
                    SizedBox(width: 5,),
                    Text('15'+" comments", style: TextStyle(color: Colors.black54)),
                  ],
                ),
                comment(
                  profilePath: "assets/images/doc2.png",
                  name: "John Edifor",
                  context: context,
                  comment: "I do not think that is quite valid if I may say. You should seek medical advice from verified specialists"
                )

              ],
            ),
          )
      ],
    ),
    )));
  }

  comment({
    required String profilePath,
    required String name,
    required String comment,
    required BuildContext context
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 25),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child:
          SizedBox(
            width: 42,
            height: 42,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/doc1.png'),
            ),
          ),
          ),

                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset('assets/images/replyicon.svg'),
                ),
                Container(
                  width: 238 ,
                  child: Column(
                    children: [
                  Container(
                  padding: EdgeInsets.all(12),
                  width: screenWidth * 0.668 ,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                     SizedBox(height: 7,),
                     Container(
                        width: 240,
                       child:
                         Text(comment, style: TextStyle(fontSize: 12, color: Colors.black54),)

                     )
                    ],
                  ),
                  ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.reply, color: Colors.blue,),
                          SizedBox(width: 5,),
                          Text('Reply', style: TextStyle(fontSize: 12, color: Colors.blue,))
                        ],
                      )
                  ]
                     )
                )
              ],
      ),
    );
  }
}