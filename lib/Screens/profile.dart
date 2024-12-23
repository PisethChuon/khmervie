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
          ],
        ),
      ),
    );
  }
}
