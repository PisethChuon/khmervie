import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[50],
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green[50]),
              accountName: const Text(
                'Vencenzo Casano',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              accountEmail: const Text(
                'vencenzo@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPictureSize: const Size.square(50),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  "V",
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            title: const Text('Go Premium'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                Get.to(() => const ());
              },
            ),
          ),
        ],
      ),
    );
  }
}
