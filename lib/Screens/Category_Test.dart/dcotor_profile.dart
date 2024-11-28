import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

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
                      SizedBox(height: 10.0),
                      Text(
                        'Demo',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              20.0, // Adjust font size for better visibility
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // You can add more sections here below
          ],
        ),
      ),
    );
  }
}
