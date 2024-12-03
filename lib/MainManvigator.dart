import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/AccountProfile.dart';
import 'package:flutter_app/Appointments.dart';
import 'package:flutter_app/Appointments/MainAppointment.dart';
import 'package:flutter_app/Notifications.dart';
import 'package:flutter_app/Capture/VitalsReading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/Medication/NoMedication.dart';

import 'Main/Dashboard.dart';
class MainNavigator extends StatefulWidget {

  MainNavigator();
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  void initState() {
    super.initState();
  }


  int _selectedIndex = 0;


  void _onItemTapped(int index ) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VitalsReading()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  late final List<Widget> _screens = [
    Dashboard(onItemTapped: _onItemTapped),
    NoMedication(),
    Container(), //
    MainAppointment(),
    AccountProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) =>
            Scaffold(
              body: _screens[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: (index) => _onItemTapped(index ),
                selectedItemColor: Color(0xff9260F4),
                unselectedItemColor: Colors.grey,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 0
                          ? 'assets/images/s_home.svg'
                          : 'assets/images/un_home.svg',
                      width: 32,
                      height: 32,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 1
                          ? 'assets/images/s_medication.svg'
                          : 'assets/images/un_medication.svg',
                      width: 32,
                      height: 32,
                    ),
                    label: 'Medication',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/main.svg',
                      width: 52,
                      height: 52,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 3
                          ? 'assets/images/s_appointment.svg'
                          : 'assets/images/un_appointment.svg',
                      width: 32,
                      height: 32,
                    ),
                    label: 'Appointment',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      _selectedIndex == 4
                          ? 'assets/images/s_account.svg'
                          : 'assets/images/un_account.svg',
                      width: 39,
                      height: 39,
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
