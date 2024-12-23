import 'package:Khmervie/Screens/booking_app.dart';
import 'package:Khmervie/Screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:Khmervie/screens/homes/home.dart';

class HomeBarNavigator extends StatefulWidget {
  const HomeBarNavigator({super.key});

  @override
  State<HomeBarNavigator> createState() => _HomeBarNavigatorState();
}

class _HomeBarNavigatorState extends State<HomeBarNavigator> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Homes(),
    const BookingApp(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[500],
        onTap: _onItemTapped,
      ),
    );
  }
}
