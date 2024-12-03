import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Main/Community.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget quickAction({
  required String iconPath,
  required Color iconBackground,
  required Color actionBackground,
  required String actionText,
}){
    return Container(
      width: 150,
      height: 51,
      padding: EdgeInsets.only(top: 12, left: 10.0, bottom: 12, right: 10),
      decoration: BoxDecoration(
        color: iconBackground.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Row(
          children: [
            Center(
              child: Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Image.asset(
                    iconPath,
                    width: 11,
                    height: 14,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Text(actionText,
              style: TextStyle(
                  fontSize: 10.0,
                  color: iconBackground
              ),),
          ],
        ),
      ),
    );
}

class Dashboard extends StatefulWidget{
  final void Function(int index) onItemTapped;
  const Dashboard({super.key,
    required this.onItemTapped});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {

  bool isCollaps = false;
  late int reverseIndex = show_notification.length -1;
  List<Map<String, dynamic>> show_notification = [
    {
      'icon': const Icon(
        Icons.message,
        color: Colors.blue,
      ),
      'text': "You have a new message from Alexander..."
    },
    {
      'icon': const Icon(
        Icons.local_pharmacy,
        color: Colors.blue,
      ),
      'text': 'Your malaria drugs have been exhausted',
    },
    {
      'icon': const Icon(Icons.devices, color: Colors.blue),
      'text': 'Your device is ready for pickup',
    },
  ];
  @override
  Widget  build(BuildContext context) {

    getFontSize(double d) {
    return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
  }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.onItemTapped(4);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/dr.png'),
                  )),
            ),
            SizedBox(width: ( 12.0)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning",
                  style: TextStyle(
                    fontSize: (16),
                  ),
                ),
                Text(
                  "Sanni Muiz",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // GestureDetector(child: SvgPicture.asset('ass')
              // onTap: (){
              //   Navigator.push(context, MaterialPageRoute(builder:
              //       (context) => Community()));
              // },
            // ),
            const SizedBox(
              width: 10,
            ),
           InkWell(
             onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Community()));
             },
             child: Icon(Icons.supervisor_account, color: Colors.black, size: (29),
             )),
            const SizedBox(width: 10,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> Notifications()));
              },
              child:
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: SvgPicture.asset(
                  'assets/images/notification.svg',
                  fit: BoxFit.contain,
                ),
                // onTap: (){
                //   Navigator.push(context, MaterialPageRoute(builder:
                //       (context) => Notifications()));
                // },
              ),
            ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              quickAction(
                  iconPath: 'assets/images/icons/dashboard/electric.png',
                  iconBackground: const Color(0xFFFF618F),
                  actionBackground: const Color(0xFFF5CFDD),
                  actionText: 'Take a quick checkup'
              ),
              Spacer(),
              quickAction(
                  iconPath: 'assets/images/icons/dashboard/device.png',
                  iconBackground: const Color(0xFFA64FFE),
                  actionBackground: const Color(0xFFD3B6E8),
                  actionText: 'Request a device'
              ),
              SizedBox(height: 10)
            ],
          ),
        SizedBox(height: 25,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:
                isCollaps ? buildNotificationList(const Stack(children: []))
                    : buildNotificationList(const Column(children: [])),)
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text("Vitals readings",
          style: TextStyle(fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold),),
              Spacer(),
              ElevatedButton(
                  onPressed: (){
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent

                  ),
                child: Text('See history',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF3C8AFF),
                ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
            Align(
            alignment: Alignment.centerLeft,
            child:
          vital(
            themeColor: Color(0xFFFF618F),
            vitalIcon: 'assets/images/hearth2.svg',
            vitalRead: '77',
            subcriptOrnot: 'bpm',
            isSubscript: true,
            vitalType: 'Heart rate (ECG)',
            dateAdded: 'Measured 10mins ago',
            vitalsReadMessage: 'NORMAL',
            emoji: 'assets/images/smily.svg'
          ),
          ),

                SizedBox(width: 25,),

                Align(
            alignment: Alignment.centerLeft,
            child:
          vital(
            themeColor: Colors.purple,
            vitalIcon: 'assets/images/presure.svg',
            vitalRead: '90/60',
            subcriptOrnot: 'mmHg',
            isSubscript: true,
            vitalType: 'Blood pressure',
            dateAdded: '5 days ago',
            vitalsReadMessage: 'ABNORMAL',
            emoji: 'assets/images/smily.svg'
          ),
          ),
            ],),
          ),
          SizedBox(height: 15,),
          SvgPicture.asset('assets/images/scroller.svg')
          ,SizedBox(height: 15,),
        ],
      ),
      ),
    );
  }

  notifications({
    required String imagePath,
    required BuildContext context,
    required String text}) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 74,
        padding: EdgeInsets.only(top: 12, left: 10.0, bottom: 12, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
        color: Colors.black.withOpacity(0.1),
      width: 1.0,
    ),
        ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xFFE2EDFF),
            ),
            width: 35,
            height: 35,
            child: Center(
              child: SvgPicture.asset(imagePath),
            ),

          ),
          SizedBox(width:10),
          Text(text,
          style: TextStyle(
            fontSize: 14,
          ),
          ),
          Spacer(),
          SvgPicture.asset('assets/images/forwardIcon.svg'),
        ],
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
  }

  Widget buildNotificationList(Widget layout) {
    int reverseIndex = show_notification.length - 1;

    List<Widget> notificationWidgets = List.generate(
      show_notification.length,
          (index) {
        Map<String, dynamic> nots = show_notification[index];
        return Center(child:  notification(
          nots['icon'],
          nots['text'],
          reverseIndex-- ,
        )
        );
      },
    );

    if (layout is Stack) {
      return Stack(children: notificationWidgets);
    } else if (layout is Column) {
      return Column(children: notificationWidgets);
    } else {
      return const SizedBox();
    }
  }

  notification(Icon icon, String text,
      int index) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    double textContSize = isCollaps ? index == 0 ?
    w * 0.60
        : index == 1
        ? w * 0.55
        : index == 2
        ? w * 0.48
        : double.infinity

        : w * 0.6
    ;

    return GestureDetector(
        onTap: (){
          setState(() {
            isCollaps = !isCollaps;
          });
        },
        child: SizedBox(
          // height: 150,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: isCollaps ?
                index == 0 ? h * 0.0
                    : index == 1
                    ? h * 0.020
                    : index == 2
                    ? h * 0.040
                    : 0
                    : 0,),

                Container(
                  alignment: Alignment.center,
                  width: isCollaps ?  index == 0 ?
                  double.infinity
                      : index == 1
                      ? w * 0.85
                      : index == 2
                      ? w * 0.78
                      : double.infinity

                      : double.infinity,
                  margin: const EdgeInsets.only(bottom: 10,),
                  padding: const EdgeInsets.only(top: 19, bottom: 19, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration:
                        const BoxDecoration(shape: BoxShape.circle, color: Color(0xffE2EDFF)),
                        child: icon,
                      ),
                      SizedBox(width: w * 0.04,),
                      Align(
                        child:
                        Container(
                          alignment: Alignment.centerLeft,
                          width: textContSize,
                          child: AutoSizeText(text,
                              style: TextStyle(fontSize: 16.0* MediaQuery.of(context).textScaleFactor, color: Colors.black45),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      const Spacer(),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue),
                      )

                    ],
                  ),

                ),
              ]
          ),
        )
    );
  }

  vital({
    required Color themeColor,
    required String vitalIcon,
    required String vitalRead,
    required String subcriptOrnot,
    required bool isSubscript,
    required String vitalType,
    required String dateAdded,
    required vitalsReadMessage,
    required emoji,
  }) {
    return Stack(
      children: [
      Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themeColor.withOpacity(0.1),
          width: 1.5,
        ),
      ),
      height: 275,
      width: 208,
      margin: EdgeInsets.only(bottom: 10),
      child:
      Stack(
        children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Container(
        child: SvgPicture.asset('assets/images/vital.svg', color: themeColor,),
        alignment: Alignment.bottomCenter,
        ),
          ],
      ),
      Container(
        padding: EdgeInsets.only(left: 15,right: 15, top: 15),
        child: Column(
            children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: themeColor
              ),
              child: Center(child: SvgPicture.asset(vitalIcon)),
            ),
          ),

            Row(
              children: [
                Text(vitalRead,
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: themeColor,
                  ),),

                if (isSubscript)
                  Text(subcriptOrnot,
                    style: TextStyle(
                      fontSize: 11.0,
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  Text(subcriptOrnot,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: themeColor,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 40,),

            Align(child: Text(vitalType,
              style: const TextStyle(
                fontSize: 19.0,
                color: Colors.white,
              ),
              ),
              alignment: Alignment.centerLeft,
                ),
              SizedBox(height: 5,),
            Align(child:
            Text(dateAdded, style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            )),
              alignment: Alignment.centerLeft,
            ),
              SizedBox(height: 5,),
            Align(child:
            IntrinsicWidth(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(18)
                ),
                padding: EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(emoji, ),
                    SizedBox(width: 5,),
                    Text(vitalsReadMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
              alignment: Alignment.centerLeft,
            )





          ],),
    )

          // Container(
          //   decoration: BoxDecoration(
          //     image: const DecorationImage(
          //       image: AssetImage('assets/images/backgroundVitals.png')
          //     ),
          //     color: themeColor
          //   ),
          //   child: Column(
          //     children: [
          //
          //

          //   ],
          // ),
          // ),



          ],)



      // margin: EdgeInsets.only(bottom: 20),
    ),
    ],
    );

  }

}
getFontSize(double d, BuildContext context) {
  return d * (MediaQuery.of(context).size.width / 375.0 + MediaQuery.of(context).size.height / 812.0) / 2.0;
}