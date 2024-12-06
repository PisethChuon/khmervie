import 'dart:ffi';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  final chipLabels = ['Dentistry', 'Surgery', 'Implanttology', 'Implantology', 'Paediatric'];
  final chipColors = Color(0xff007AFF);
  
  DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header section
            Stack(
              clipBehavior: Clip
                  .none, // Ensure the stack can extend beyond bounds if necessary
              children: [
                Container(
                  height: 320,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(190),
                      bottomRight: Radius.circular(190),
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  right: 20,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/icons/Doctor_1.png'),
                  ),
                ),
                Positioned(
                  top:
                      123, // Adjusted top to create enough space for text below image
                  left: 1,
                  right: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/doctor_profile.png'),
                      const SizedBox(height: 10.0),
                      const Text(
                        'xxx',
                        style: TextStyle(
                          color: Color(0XFF1C1C1E),
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'xxx, xxxxx',
                        style: TextStyle(
                          color: Color(0XFF1C1C1E),
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // You can add more sections here below
            const SizedBox(height: 75.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: Colors.green),
                          SizedBox(width: 5),
                          Text(
                            "10.00 am - 3.00 pm",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text(
                            '4.5',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Experiene: 19 years',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Type : Surgeon',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s,',
                    style: TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 96, 96, 96)),
                  ),
                  const Text(
                    'Speciality',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  const Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Chip(label: Text('Dentistry')),
                      Chip(label: Text('Surgery')),
                      Chip(label: Text('Implantology')),
                      Chip(label: Text('Paediatric')),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 80),
                      ),
                      onPressed: () {
                        //
                      },
                      child: const Text(
                        'Appointment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

