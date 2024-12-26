/* 

User Detail Profile

It is detial of all information about personal patients and edting.

Author: Piseth Chuon

*/

import 'package:flutter/material.dart';

class DateOfBirth extends StatelessWidget {
  final String label;
  final String value;

  const DateOfBirth({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Text(value),
      ),
    );
  }
}

class Weight extends StatelessWidget {
  final String label;
  final String value;
  const Weight({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: value,
          ),
        ),
      ),
    );
  }
}

class Height extends StatelessWidget {
  final String label;
  final String value;

  const Height({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Text(value),
      ),
    );
  }
}

class BMI extends StatelessWidget {
  final String label;
  final String value;

  const BMI({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
