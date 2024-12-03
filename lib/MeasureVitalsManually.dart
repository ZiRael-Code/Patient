import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


void main(){
  runApp(MeasureVitalsManually());
}

class MeasureVitalsManually extends StatefulWidget {

  const MeasureVitalsManually({super.key});
  @override
  _MeasureVitalsManuallyScreen createState() => _MeasureVitalsManuallyScreen();
}

class _MeasureVitalsManuallyScreen extends  State<MeasureVitalsManually> with SingleTickerProviderStateMixin{
  String? _selectedValue;
  late TabController _tabController = TabController(length: 2, vsync: this);
  final TextEditingController _controller = TextEditingController();

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
                  'Measure vitals manually',
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
          child: Column(
        children: [
        SizedBox(height: 40),
          Container(
            height: 50,
            padding: EdgeInsets.all(4),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffE0E0E0),
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
              child: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                indicatorColor: Colors.transparent, // Removes the default bottom underline
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xff4F4F4F),
                tabs: [
                  Tab(text: "Single entry"),
                  Tab(text: "Multiple entries"),

                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Center(child: singleEntry()),
                Center(child: multipleEntry()),
              ],
            ),
          ),
          ],
        ),
    ))));
  }

  singleEntry() {
    return Column(
      children: [
        SizedBox(height: 25.0),
      Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child:
          Text(

            'Vital to measure',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),

        SizedBox(height: 15.0),

        // Account Number TextField
        TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.keyboard_arrow_down),
            hintText: 'e.g blood pressure',
            hintStyle: TextStyle(
              color: Color(0xffF2F2F2),
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
      ],),
        SizedBox(height: 25.0),

    textField(
        textType: TextInputType.number,
        textHeader: 'Vital to measure',
        textHint: "e.g blood pressure"
    )
    ]
    );

  }

  multipleEntry() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        entry(
          num: 'Reading 1',
          textType: 'Blood Pressure',
        ),
        entry(
          num: 'Reading 2',
          textType: 'Hearth rate',
        ),
        SizedBox(height: 70,),
        Container(
          width: 160,
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFE2EDFF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_circle_outline, color: Colors.blue,),
                SizedBox(width: 10,),
                Text('Add Entry', style: TextStyle(color: Colors.blue, fontSize: 16),)
              ],
            )
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
              'Save records',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  entry({required String num,
    required String textType}) {
    return Column(
      children: [
        SizedBox(height: 25.0),
    Row(
    children: [

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          num,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black
          ),
        ),
        Text(textType),

        ],
      ),
        Spacer(),

            Container(
              width: 33, height: 33,
              decoration: BoxDecoration(
                color: Color(0xffE2EDFF),
              shape: BoxShape.circle
            ),
            child: Icon(Icons.edit, color: Colors.blue,),
            ),
            SizedBox(width: 10,),
            Container(
              width: 33, height: 33,
              decoration: BoxDecoration(
                color: Color(0xffFF6161).withOpacity(0.15),
              shape: BoxShape.circle
            ),
            child: Icon(Icons.delete, color: Colors.red,),
            ),
          ],
        ),
        SizedBox(height: 15,),
        SvgPicture.asset('assets/images/line.svg'),
        SizedBox(width: 20,),

    ]
        );
  }
}

textField({
  required TextInputType textType,
  required String textHeader,
  required String textHint
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child:
        Text(

          textHeader,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),

      SizedBox(height: 15.0),

      // Account Number TextField
      TextField(
        decoration: InputDecoration(
          hintText: textHint,
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
        keyboardType: textType,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
    ],);
}

delete_popuo(){
  return Column(
    children: [
      Text('Are you sure you want to delete this entry?'),
      Row(
        children: [
          SizedBox(
          child: ElevatedButton(
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
                'Yes',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          ),

          SizedBox(width: 15,),

          SizedBox(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
                side: BorderSide(
                  width: 1,
                  color: Colors.blue
                )
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
          ),
        ],
      )
    ],
  );
}
