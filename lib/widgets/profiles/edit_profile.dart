import 'package:flutter/material.dart';

class DateOfBirth extends StatelessWidget {
  final String label;
  final String value;
  
  const DateOfBirth ({super.key, required this.label, required this.value});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label),),
      body: Center (child: Text('Details about Date of Birth'),),
    );
  }
  
}
class Weight extends StatelessWidget {
  final String label;
  final String value;
  
  const Weight ({super.key, required this.label, required this.value});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label),),
      body: Center (child: Text('Details about Weight'),),
    );
  }
  
}