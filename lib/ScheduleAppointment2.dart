import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(ScheduleAppointment2());
}

class ScheduleAppointment2 extends StatefulWidget {
  const ScheduleAppointment2({super.key});
  @override
  ScheduleAppointment2State createState() => ScheduleAppointment2State();
}

class ScheduleAppointment2State extends State<ScheduleAppointment2> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {

    return MaterialApp( home: Scaffold(
      appBar: AppBar(
        title:
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 32,
              height: 32,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFE5E5E5),
              ),
              child: SvgPicture.asset(
                'assets/images/back.svg',
                color: Colors.white,
                width: 8.0,
                height: 15,
              ),
            ),
            Spacer(),
            Text(
              'Book Appointment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Spacer(),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
          children: [
            TableCalendar(
              firstDay: _focusedDay,
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  // _focusedDay = focusedDay; // update focusedDay as well
                });
              },
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronIcon: Container(
                  height: 23,
                  width: 23,
                  child: Center(child: Icon(Icons.arrow_back_ios, color: Colors.blue, size: 15,),),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.20),
                  ),
                ),
                rightChevronIcon: Container(
                  height: 23,
                  width: 23,
                  child: Center(child:  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue, size: 15,),),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.20),
                  ),
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.black, fontSize: 14),
                weekdayStyle: TextStyle(color: Colors.black, fontSize: 14),
                decoration: BoxDecoration()
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.black,fontSize: 20),
                weekNumberTextStyle: TextStyle(fontSize: 20),
                defaultTextStyle: TextStyle(fontSize: 20),
                todayTextStyle: TextStyle(fontSize: 20),
                disabledTextStyle: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20,),

          Container(
            margin: EdgeInsets.only(right: 5, top: 15),
            padding: EdgeInsets.only(top: 12, left: 25, bottom: 12, right:25),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(35), width: 0.5),
                color: Color(0x262E2E42).withOpacity(15),
                borderRadius: BorderRadius.circular(50),
            ),
            child: Text("Tue, 16 Aug", style: TextStyle(fontSize: 12),),
          ),

            SizedBox(height: 20,),

            Align(
              alignment: Alignment.centerLeft,
              child:Text('Select time', textAlign: TextAlign.left,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),),
            ),
        SizedBox(height: 10,),
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(9),
          ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                hintText: 'Input time or select from below',
                hintStyle: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
        ),

            SizedBox(height: 7,),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  wicd(text: "MON"),
                  wicd(text: "TUE"),
                  wicd(text: "WED"),
                  wicd(text: "THUR"),
                ],
              ),
            ),
        SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child:Text('Appointment type', textAlign: TextAlign.left,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),),
            ),



            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(9),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                value: _selectedValue, // Variable to hold the selected value
                hint: Text(
                  'Input time or select from below',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                isExpanded: true, // Makes dropdown take full width
                underline: SizedBox(), // Hides the default underline
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, // Dropdown item color
                ),
                icon: Icon(Icons.arrow_drop_down), // Dropdown icon
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                },
                items: <String>['10:00 AM', '12:00 PM', '02:00 PM', '04:00 PM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10,),

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
                  'Book an appointment',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),



          ],
        ),
      ),
    ),),);

  }


  wicd({
    required String text
  }){
    return Container(
      margin: EdgeInsets.only(right: 5, top: 15),
      padding: EdgeInsets.only(top: 12, left: 25, bottom: 12, right:25),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.5),
          color: Color(0xFFE2EDFF),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Text(text, style: TextStyle(fontSize: 12),),
    );
  }

}