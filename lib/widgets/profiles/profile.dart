import 'package:Khmervie/Drawer_Widget/drawer.dart';
import 'package:Khmervie/widgets/profiles/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class Profiles extends StatelessWidget {
  const Profiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        // Wrap Column in SingleChildScrollView
        child: Column(
          children: [
            // Profile Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/icons/Khmervie.png'),
                  ),
                  title: Text(
                    'Piseth Chuon',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Male',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Details Info
            ListView(
              shrinkWrap: true, // Add shrinkWrap to prevent overflow
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              children: [
                buildDetailItem(
                  context,
                  icon: Icons.calendar_today,
                  label: 'Date of birth',
                  value: '27/12/2003',
                ),
                buildDetailItem(
                  context,
                  icon: Icons.monitor_weight,
                  label: 'Weight',
                  value: '61.0',
                ),
                buildDetailItem(
                  context,
                  icon: Icons.height,
                  label: 'Height',
                  value: '170.0',
                ),
                buildDetailItem(
                  context,
                  icon: Icons.calculate,
                  label: 'BMI',
                  value: '21.11 (Normal)',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildDetailItem(
  BuildContext context, {
  required IconData icon,
  required String label,
  required String value,
}) {
  return Card(
    elevation: 2,
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to different pages base on the label or value
          if (label == 'Date of birth') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DateOfBirth(label: label, value: value),
              ),
            );
          } else if (label == 'Weight') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Weight(label: label, value: value),
              ),
            );
          }
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green,
            child: Icon(icon, color: Colors.white),
          ),
          title: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
