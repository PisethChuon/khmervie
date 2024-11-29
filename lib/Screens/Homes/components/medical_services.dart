import 'package:Khmervie/Screens/Category_Test.dart/blood_tests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalServicesScreen extends StatelessWidget {
  const MedicalServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            // Items array with onTap handlers
            final items = [
              {
                'icon': Icons.water_drop,
                'label': 'Blood Tests',
                'onTap': () => Get.to(() => const BloodTests()),
              },
              {'icon': Icons.coronavirus, 'label': 'Covid-19', 'onTap': () {}},
              {
                'icon': Icons.psychology,
                'label': 'Mental Health',
                'onTap': () {}
              },
              {
                'icon': Icons.health_and_safety,
                'label': 'HIV Tests',
                'onTap': () {}
              },
              {'icon': Icons.child_care, 'label': 'Baby', 'onTap': () {}},
              {'icon': Icons.hearing, 'label': 'Pure-tone', 'onTap': () {}},
            ];


            final item = items[index];

            // Return a clickable grid item
            return GestureDetector(
              onTap: item['onTap'] as VoidCallback, // Detect tap and call onTap
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF34c759),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 36.0,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      item['label'] as String,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],                  
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
