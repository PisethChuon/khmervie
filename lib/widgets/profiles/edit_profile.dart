import 'package:flutter/material.dart';

// DateOfBirth
class DateOfBirth extends StatelessWidget {
  final String label;
  final String value;

  const DateOfBirth({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
// Big Text bith
        title: Text(label),
      ),
      body: const Center(
        child: Text('Details about Date of Birth'),
      ),
    );
  }
}

// Button Save

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
      body: const Center(
        child: Text('Weight'),
      ),
    );
  }
}
