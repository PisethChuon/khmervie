import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Khmervie/screens/homes/home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center the column's children
          children: [
            Image.asset(
              'assets/icons/Khmervie.png',
              height: 300, // Adjust height as needed
            ),
            const SizedBox(height: 120), // Add spacing between image and text
            const Text('xxxxxxxx'),
            ElevatedButton(
              onPressed: () => Get.to(() => const Homes()),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'Continute',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
