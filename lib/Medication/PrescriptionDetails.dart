import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Medication/DrugInformation.dart';
import 'package:flutter_app/Medication/MedicationUsageConfirmation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(PrescriptionDetails());
}

class PrescriptionDetails extends StatefulWidget {
  const PrescriptionDetails({super.key});
  @override
  _PrescriptionDetailsScreen createState() => _PrescriptionDetailsScreen();
}

class _PrescriptionDetailsScreen extends  State<PrescriptionDetails> {
  String? _selectedValue;
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List<bool>.filled(1000, false);
  }
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
                  'Prescription details',
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
        Align(
          alignment: Alignment.centerLeft,
          child:
        Text('Current prescriptions', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, color: Color(0xff2E2E42)),),
        ),
          SizedBox(height: 20),
        Container(
            margin: EdgeInsets.only(bottom: 20),
          child: 
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              child: Text(style: TextStyle(color: Colors.white),'14th June; 2022'),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: Colors.blue,
                )
              ),
              child: Text('24th June; 2022', style: TextStyle(color: Colors.blue),),
            )
          ],
        )
        ),

        GestureDetector(
          onTap: () {
            calender_bottom_sheet();
// month view TODO
          },
          child:
        Row(
          children: [
            Text('July 2022', style: TextStyle( fontSize: 16,color: Colors.blue),),
            SizedBox(width: 5),
            Icon(Icons.keyboard_arrow_down_outlined, color: Colors.blue,)
          ],
        ),
        ),
        SizedBox(height: 8),

        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
        Row(
          children: [
            date(
                day: 'Mon',
                date: '18',
                isToday: false,
              color: Colors.redAccent
            ),
            date(
                day: 'Tue',
                date: '19',
                isToday: false
            ),

            date(
                day: 'Wed',
                date: '20',
                isToday: true
            ),
            date(
                day: 'Thur',
                date: '21',
              isToday: false
            ),
            
            date(
                day: 'Thur',
                date: '22',
              isToday: false
            ),

            date(
                day: 'Thur',
                date: '23',
              isToday: false
            ),

            date(
                day: 'Thur',
                date: '24',
              isToday: false
            ),

          ],
        )),),
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Prescriptions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),))
          ,SizedBox(height: 15),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, right: 5),
              width: 105,
              decoration: BoxDecoration(
                color: Color(0xFF000000).withOpacity(0.90),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.only(left: 14, right: 10),
              child: DropdownButton<String>(
                value: _selectedValue,
                hint: Text(
                  'Select a Time',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                dropdownColor: Color(0xFF000000), // Dark background for dropdown
                items: <String>['Morning', 'Afternoon', 'Evening', 'Night']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white), // White text for items
                    ),
                  );
                }).toList(),
              ),
            ),

            Container(
                margin: EdgeInsets.only(left: 8, right: 5),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xff2E2E421A),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                    children: [
                      Text('Total amount of drugs left: ',  style: TextStyle(fontSize: 13,)),
                      Text('80%', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    ]
                )
            )
          ],
        ),
        SizedBox(height: 25,),
        drug(
            index: 0,
            icon: 'assets/images/drug1.svg',
            name: 'Ibuprofen',
            dosage: '1 pill(s) . 2x daily'
        ),
        drug(
            index: 1,
            icon: 'assets/images/drug2.svg',
            name: 'Cough Syrup',
            dosage: '1 pill(s) . 2x daily'
        ),
        drug(
            index: 2,
            icon: 'assets/images/drug1.svg',
            name: 'Ibuprofen',
            dosage: '1 pill(s) . 2x daily'
        ),
        drug(
            index: 3,
            icon: 'assets/images/drug2.svg',
            name: 'Cough Syrup',
            dosage: '1 pill(s) . 2x daily'
        ),

       Align(alignment: Alignment.centerLeft, child:  Text('History', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
       ),
        SizedBox(height: 15),
          history(
              des: "Prescription by Dr. Chima",
              date: '11th June - 11 July 2022'
          ),

          history(
              des: "Prescription by Dr. Chima",
              date: '11th June - 11 July 2022'
          ),

          history(
              des: "Prescription by Dr. Chima",
              date: '11th June - 11 July 2022'
          ),

      ],
    ),
    ))));
  }

  date({required String day,
    required String date,
    required bool isToday,
    color
  }) {
    return Container(
      margin: EdgeInsets.only(right: 5),
        child: Container(
            child: Stack(
            children: [

              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 7),
                width: 48,
                height: 67,
                decoration: BoxDecoration(
                  color: isToday ? Colors.blue : Color(0xffE2EDFF).withOpacity(0.30),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(day, style: TextStyle(color: isToday ? Colors.white : Colors.black,),),
                    SizedBox(height: 4,),
                    Text(date, style: TextStyle(color: isToday ? Colors.white : Colors.black, fontSize: 24, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              color != null ?
              Align(
                alignment: Alignment.topCenter,
                child:
                Container(
                margin: EdgeInsets.only(left: 20),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
                  :
              Container(),
            ]
        )
    )
    );
  }

  drug({required String icon,
    required String name,
    required String dosage,
    required int index,
  }) {
    return  GestureDetector(

      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(width: 0.05, color: Colors.black)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              padding: EdgeInsets.all(10),
              width: 39,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xff40FB5E).withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Align(alignment: Alignment.topCenter, child: SvgPicture.asset(icon)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(color: Color(0xff2E2E42), fontSize: 20),),
                Text(dosage, style: TextStyle(color: Color(0xff2E2E42))),
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
                child: Icon(Icons.check, color: isSelectedList[index] ? Colors.white : Color(0xffC2C2C2))
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          isSelectedList[index] =!isSelectedList[index];
        });
      },
    );
  }
  history({required String des,
    required String date}) {
    return Container(
      padding: EdgeInsets.only(left: 14,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(des, style: TextStyle(fontSize: 18, color: Colors.black)),
              Spacer(),
      GestureDetector(
        onTap: () {
          show_drug_info_bottom_sheet(context);
          // Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> DrugInformation()));
        },
        child:
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE2EDFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
                child: Text('View details', style: TextStyle(fontSize: 10, color: Colors.blue)),
              ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(date, style: TextStyle(fontSize: 12, color: Color(0xff000000).withOpacity(0.60)),),
          SizedBox(height: 20),
          SvgPicture.asset('assets/images/line.svg'),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  void show_drug_info_bottom_sheet(BuildContext context) {
    bool isToday = true;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to expand based on content
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title
              Text(
                'Drug Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              // Drug Name
              Row(
                children: [
                  Text(
                    'Drug name:',
                    style: TextStyle(color: Color(0xff2E2E42)),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Ibuprofen 500mg x 24',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SvgPicture.asset('assets/images/line.svg'),
              SizedBox(height: 15),

              // Drug Type and Dosage
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Drug type:', style: TextStyle(color: Color(0xff666666))),
                      SizedBox(height: 4),
                      Text('Capsules', style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dosage:', style: TextStyle(color: Color(0xff666666))),
                      SizedBox(height: 4),
                      Text('2 pills', style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Amount Used and Total Duration
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amount used:', style: TextStyle(color: Color(0xff666666))),
                      SizedBox(height: 4),
                      Text('5/20', style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total duration:', style: TextStyle(color: Color(0xff666666))),
                      SizedBox(height: 4),
                      Text('2 weeks', style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Frequency
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Frequency:', style: TextStyle(color: Color(0xff666666))),
                    SizedBox(height: 4),
                    Text(
                      '3X daily [ Morning, Afternoon, Night ]',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Commentary
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Commentary:', style: TextStyle(color: Color(0xff666666))),
              ),
              SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'The patient should ensure to use the medications as prescribed and also use the medication after eating. On no occasion should the patient use the medication on an empty stomach.',
                  style: TextStyle(color: Color(0xff666666), fontSize: 16),
                ),
              ),
              SizedBox(height: 25),

              SvgPicture.asset('assets/images/line.svg'),
              SizedBox(height: 20),

              // Action Section
              Row(
                children: [
                  // Circle Button
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: isToday ? Colors.green : Color(0xffF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: isToday
                        ? Center(
                      child: SvgPicture.asset(
                        'assets/images/mark.svg',
                        color: Colors.white,
                      ),
                    )
                        : null,
                  ),
                  SizedBox(width: 20),

                  // Description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Not used this morning',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Click on this circle to indicate that you’ve used the medication.',
                          style: TextStyle(fontSize: 14, color: Color(0xff2E2E42)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  calender_bottom_sheet() {
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Top Section with arrows, month, and year
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left, color: Colors.blue),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month - 1,
                            );
                          });
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat('MMMM').format(_focusedDay),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _focusedDay.year.toString(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right, color: Colors.blue),
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month + 1,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // Calendar Section
                TableCalendar(
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2100, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    // Do not change the selected day
                    setState(() {
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: true,
                    todayDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    defaultDecoration: BoxDecoration(
                      color: Color(0xffE2EDFF).withOpacity(0.30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    weekendDecoration: BoxDecoration(
                      color: Color(0xffE2EDFF).withOpacity(0.30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    outsideTextStyle: TextStyle(color: Colors.grey),
                    defaultTextStyle: TextStyle(color: Colors.black),
                    cellMargin: EdgeInsets.all(
                        18.0), // Vertical space between cells
                  ),
                  headerVisible: false,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    weekendStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    todayBuilder: (context, day, focusedDay) {
                      return _buildDateCell(day, isToday: true);
                    },
                    defaultBuilder: (context, day, focusedDay) {
                      return _buildDateCell(day, isToday: false);
                    },
                    outsideBuilder: (context, day, focusedDay) {
                      return _buildDateCell(
                          day, isToday: false, isGrayedOut: true);
                    },
                  ),
                ),

                SizedBox(height: 16),

                // Legend Section
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLegendRow(Colors.red,
                        'The medication were not taken for that day', 'Not'),
                    _buildLegendRow(Colors.orange,
                        'Some of the medication were taken that day', 'Some'),
                    _buildLegendRow(
                        Colors.green, 'All the medication were taken that day',
                        'All'),
                  ],
                ),
              ],
            ),
          );
        }
    );
  }

        // Custom Date Cell Design
        Widget _buildDateCell(DateTime day, {bool isToday = false, bool isGrayedOut = false}) {
      String formattedDay = DateFormat.E().format(day).substring(0, 3); // Mon, Tue, etc.
      String date = day.day.toString();

      // Determine the color for the dot based on your condition (replace this with your logic)
      Color? dotColor;
      // Example condition (replace with actual logic)
      if (date == '1') { // Example condition for the first day of the month
        dotColor = Colors.red; // Set dot color
      } else if (date == '15') {
        dotColor = Colors.orange;
      } else if (date == '30') {
        dotColor = Colors.green;
      }

      return Container(
        margin: EdgeInsets.only(right: 0),
        padding: EdgeInsets.all(5),
        width: 48,
        height: 67,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 7),
              width: 48,
              height: 67,
              decoration: BoxDecoration(
                color: isToday ? Colors.blue : Color(0xffE2EDFF).withOpacity(0.30),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formattedDay,
                    style: TextStyle(
                      color: isToday ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date,
                    style: TextStyle(
                      color: isToday ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            if (dotColor != null) // Create dot only if color is not null
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 4), // Adjust as needed for positioning
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: dotColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    // Legend Item Design
    Widget _buildLegendRow(Color color, String text, String boldText) {
      return Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(width: 8),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: '$boldText ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: text.replaceFirst(boldText, '')),
              ],
            ),
          ),
          SizedBox(height: 8),
        ],
      );
    }


}