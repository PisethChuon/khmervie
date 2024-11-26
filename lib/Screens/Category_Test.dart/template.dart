import 'package:flutter/material.dart';

class TemplateCategory extends StatelessWidget {
  final String title;
  final Widget content;

  const TemplateCategory({
    super.key,
    required this.title,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[100],
        iconTheme: const IconThemeData(color: Colors.green),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.green, fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}
