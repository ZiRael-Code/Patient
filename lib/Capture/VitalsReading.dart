import 'package:flutter/material.dart';
import 'package:flutter_app/Main/MeasureVitalsManuallyMenu.dart';
import 'package:flutter_app/MeasureBloodPresure.dart';
import 'package:flutter_app/MeasureHearthRate.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(VitalsReading());


class VitalsReading extends StatefulWidget {
  @override
  _VitalsReadingState createState() => _VitalsReadingState();
}

class _VitalsReadingState extends State<VitalsReading>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        title: Row(children: [
          Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.home_outlined, color: Colors.white),
        ),
        Spacer(),
        Text('Vital Readings', style: TextStyle(color: Colors.white)),
          Spacer(),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.blue[200],
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(Icons.share, color: Colors.white)),
          ),
        ],
      ),



        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            _buildTabButton('Take Readings'),
            _buildTabButton('History'),
            _buildTabButton('Devices'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTakeReadingsContent(),
          _buildHistoryContent(),
          _buildDevicesContent(),
        ],
      ),
    );
  }
  Widget _buildTabButton(String text) {
    return Tab(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTakeReadingsContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textFormat(
              text1: "Measure Readings",
              text2: 'Select what vitals you want to measure',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: [
                  vital(
                    themeColor: Color(0xFFFF618F),
                    vitalIcon: 'assets/images/hearth.svg',
                    vitalRead: '77',
                    subcriptOrnot: 'bpm',
                    isSubscript: true,
                    vitalType: 'Heart rate (ECG)',
                    dateAdded: 'Measured 10mins ago',
                    vitalsReadMessage: 'NORMAL',
                  ),
                  vital(
                    themeColor: Colors.purple,
                    vitalIcon: 'assets/images/bloodpressure.svg',
                    vitalRead: '90/60',
                    subcriptOrnot: 'mmHg',
                    isSubscript: true,
                    vitalType: 'Blood pressure',
                    dateAdded: '5 days ago',
                    vitalsReadMessage: 'ABNORMAL',
                  ),
                  vital(
                    themeColor: Colors.deepOrange,
                    vitalIcon: 'assets/images/tunder.svg',
                    vitalRead: '77',
                    subcriptOrnot: 'bpm',
                    isSubscript: true,
                    vitalType: 'Heart rate (ECG)',
                    dateAdded: 'Measured 10mins ago',
                    vitalsReadMessage: 'NORMAL',
                  ),
                  vital(
                    themeColor: Color(0xFF2C68BF),
                    vitalIcon: 'assets/images/02.svg',
                    vitalRead: '95%',
                    subcriptOrnot: ' ',
                    isSubscript: false,
                    vitalType: 'Oxygen saturation',
                    dateAdded: '5 days ago',
                    vitalsReadMessage: 'ABNORMAL',
                  ),


                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "If you don't have the device, you can still measure by clicking the button below",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: (){
                // Navigate to the details page
                Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureVitalsManuallyMenu()));
              },
              child: _buildActionButton('Capture Manually', Colors.blue, Colors.white)
            ),
            SizedBox(height: 10),
            _buildActionButton('Request for the Device', Colors.transparent, Colors.blue, hasBorder: true),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }


  Widget _buildHistoryContent() {
    return SingleChildScrollView(  // Add SingleChildScrollView here
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),

            // Text Format Section
            textFormat(
              text1: "Measure Readings",
              text2: 'Select what vitals you want to measure',
            ),

            SizedBox(height: 20,),

            // Wrap for icons and readings
            Wrap(
              direction: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the details page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureHearthRate()));
      },
                  child:
                readingHistory(
                  icon: "assets/images/hearth2.svg",
                  themeColor: Color(0xFFFF618F),
                  name: "Heart rate",
                ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the details page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MeasureBloodPresure()));
                  },
                  child: readingHistory(
                  icon: "assets/images/presure.svg",
                  themeColor: Color(0xFFA64FFE),
                  name: "Blood pressure",
                ),
                ),
                readingHistory(
                  icon: "assets/images/oxy.svg",
                  themeColor: Color(0xFF2C68BF),
                  name: "Oxygen saturation",
                ),

                readingHistory(
                  icon: "assets/images/st.svg",
                  themeColor: Color(0xFFFF6161),
                  name: "Stress level",
                ),
                readingHistory(
                  icon: "assets/images/bg.svg",
                  themeColor: Color(0xFF3C8AFF),
                  name: "Blood glucose",
                ),
                readingHistory(
                  icon: "assets/images/bt.svg",
                  themeColor: Color(0xFFFF8E3C),
                  name: "Body Temperature",
                ),
              ],
            ),

            SizedBox(height: 15,),

            // Readings History Header
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Readings History',
                style: TextStyle(
                  fontSize: 18,        // Font size 18
                  fontWeight: FontWeight.bold,  // Bold text
                ),
              ),
            ),

            SizedBox(height: 10,),

            // Reading History List
            reading_history(
              mmhg: "107/60",
              bpm: "67",
              date: "Today, 12:00 am",
              bulletColor: Colors.lightGreenAccent,
            ),
            SizedBox(height: 10,),
            reading_history(
              mmhg: "125/60",
              bpm: "88",
              date: "14 Jul 2022. 12:00 am",
              bulletColor: Color(0xFFFAB400),
            ),
            SizedBox(height: 10,),

            irregular_reading_history(
                date: "14 Jul 2022 . 12:00 am",
                text: "Irregular ECG",
                stackColor:  Color(0xFFFAB400)
            ),
            SizedBox(height: 10,),
            reading_history(
              mmhg: "125/68",
              bpm: "88",
              date: "14 Jul 2022 . 12:00 am",
              bulletColor: Color(0xFFFF6161),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDevicesContent() {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(12),
        child: Column(children: [
          textFormat(
            text1: "Devices",
            text2: 'View history of any vitals by directly tapping on their icons.',
          ),
          SizedBox(height: 20,),
        Wrap(children: [
          devices(
            name: "BP2 Connect",
            imagePath: "assets/images/dev.svg"
          ),
          SizedBox(width: 20,),
          devices(
            name: "Device 2",
            imagePath: "assets/images/dev.svg"
          ),
          devices(
            name: "Device 3",
            imagePath: "assets/images/dev.svg"
          ),
          SizedBox(width: 20,),
          Column(
              children: [
                Container(
                  width: 73,
                  height: 73,
                  decoration: BoxDecoration(
                    color: Color(0xffE2EDFF),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(Icons.add, color: Colors.blue, size: 32,),
                ),
                Text('Order for a new device')
              ]
          )
],)
        ],),

      ),
    );
  }

  Widget _buildActionButton(String text, Color backgroundColor, Color textColor,
      {bool hasBorder = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: hasBorder ? Border.all(color: Colors.blue) : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
  }) {
    return Container(
      margin: EdgeInsets.only(right: 3),
      child: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: themeColor.withOpacity(0.1),
                width: 1.5,
              ),
            ),
            height: 186,
            width: 156,
            margin: EdgeInsets.only(bottom: 10),
            child:
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: SvgPicture.asset('assets/images/vt.svg', color: themeColor,),
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
                          width: 45,
                          height: 45,
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
                              fontSize: 37.0,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),),

                          if (isSubscript)
                            Text(subcriptOrnot,
                              style: TextStyle(
                                fontSize: 10.0,
                                color: themeColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          else
                            Text(subcriptOrnot,
                              style: TextStyle(
                                fontSize: 10.0,
                                color: themeColor,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 30,),

                      Align(child: Text(vitalType,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 2,),
                      Align(child:
                      Text(dateAdded, style: const TextStyle(
                        fontSize: 9.0,
                        color: Colors.white,
                      )),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 2,),






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
    ),
    );

  }

  textFormat({
    required String text1,
    required String text2
  }) {
    return Column(
      children: [
        Text(
     text1,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    SizedBox(height: 10),
    Container(
      width: 263,
      child:
    Text(
    text2, textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16),
    ),
        ),

    SizedBox(height: 25,),

    ],
    );
  }

  readingHistory({
    required icon,
    required themeColor,
    required String name
  }) {
    return Column(children: [
      Container(
    width: 86,
    height: 86,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: themeColor
    ),
    child: Center(child: SvgPicture.asset(icon)),
    margin: EdgeInsets.only(right: 20),
    ),
      SizedBox(height: 2,),
      Container(
        width: 86,
        margin: EdgeInsets.only(right: 20),
      child: Text(name, textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
      ),
      SizedBox(height: 20,),
    ]
    );
  }

 reading_history({
    required mmhg,
    required bpm,
    required date,
    required bulletColor,
  }){
    return Container(
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 28),
              width: 11,
              height: 11,
              decoration: BoxDecoration(
                color: bulletColor, // Lemon green color
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 16), // Space between the circle and the texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      mmhg,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'mmHg',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      bpm,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'BPM',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  irregular_reading_history({
    required text,
    required date,
    required stackColor,
  }) {
    return Container(
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only( right: 10),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: 
              SvgPicture.asset("assets/images/irr.svg", fit: BoxFit.fitHeight,)
          ),
          SizedBox(width: 16),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 16,
                  color: Colors.black,
                ),
                ),




          ],),

            )],
      ),
    );
  }

  devices({
    required String name,
    required String imagePath
  }) {
    return Container(
      child: Column(children: [
      Container(
      width: 143,
      height: 143,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.2))
      ),
      child:
      Center(child: SvgPicture.asset(imagePath),),
    ),
      SizedBox(height: 10,),
      Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 20, ),
    ],),
    );
  }

}
