import 'package:Khmervie/Screens/Category_Test.dart/template.dart';
import 'package:Khmervie/Screens/Homes/components/card_doc.dart';
import 'package:flutter/material.dart';

class BloodTests extends StatelessWidget {
  const BloodTests({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateCategory(
      title: 'Blood Tests',
      content: DoctorList(),
    );
  }
}
