import 'package:Khmervie/Navagation/home.dart';
import 'package:Khmervie/login/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        home: SignUpScreen()); // Replace SignUpScreen with HomeBarNavigator
  }
}
