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


class Coronavirus extends StatelessWidget {
  const Coronavirus ({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateCategory(
      title: 'Coronavirus',
      content: DoctorList(),
    );
  }
}

class MentalHealth extends StatelessWidget {
  const MentalHealth ({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateCategory(
      title: 'MentalHealth',
      content: DoctorList(),
    );
  }
}

class HIV extends StatelessWidget {
  const HIV ({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateCategory(
      title: 'HIV',
      content: DoctorList(),
    );
  }
}

class Baby extends StatelessWidget {
  const Baby ({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateCategory(
      title: 'Baby',
      content: DoctorList(),
    );
  }
}

class PureTone extends StatelessWidget {
  const PureTone ({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateCategory(
      title: 'PureTone',
      content: DoctorList(),
    );
  }
}

