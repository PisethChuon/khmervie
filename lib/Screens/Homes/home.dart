import 'package:Khmervie/Drawer_Widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Khmervie/screens/homes/components/location.dart';
import 'package:Khmervie/screens/homes/components/medical_services.dart';
class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'Hi, Vincenzo',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black, size: 24),
        ],
      ),
      drawer: const CustomDrawer(), // Drawer is linked here
      backgroundColor: Colors.grey[100],
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 45.0),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Location(),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: MedicalServicesScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
