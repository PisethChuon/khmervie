// For findout
import 'package:flutter/material.dart';

class TemplateScreen extends StatelessWidget {
  final String title;
  final Widget content;

  const TemplateScreen({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 102, 76, 175),
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}
