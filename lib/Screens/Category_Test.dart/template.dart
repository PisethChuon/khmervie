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
      // backgroundColor: const Color.fromARGB(255, 102, 76, 175),
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}
