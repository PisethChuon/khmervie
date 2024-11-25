import 'package:Khmervie/Screens/Category_Test.dart/template.dart';
import 'package:flutter/material.dart';

class BloodTests extends StatelessWidget {
  const BloodTests({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateCategory(
      title: 'Blood Tests',
      content: Center(
        child: Text(
          'Blood Tests Session',
        ),
      ),
    );
  }
}
