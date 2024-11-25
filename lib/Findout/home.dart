import 'package:Khmervie/Findout/screenone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Go to Screen One'),
            onTap: () {
              Get.to(() => const ScreenOne());
            },
          ),
          ListTile(
            title: Text('Go to Screen Two'),
            onTap: () => Get.to(ScreenTwo()),
          )
        ],
      ),
    );
  }
}
