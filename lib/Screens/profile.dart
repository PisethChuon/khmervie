import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 30.0),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
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
                // onTap: () {
                //   print('Tapped');
                // },
              ),
            ),
            // Details Info
            Expanded(
              child: ListView(
                children: [
                  buildDetailItem(
                    context,
                    icon: Icons.calendar_today,
                    label: 'Date of birth',
                    value: '27/12/2003',
                  )
                ],
              ),
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
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              // Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        )

        // onTap: () {
        //   print('$label tapped');
        // },
        ),
  );
}
