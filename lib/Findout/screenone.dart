import 'package:Khmervie/Findout/template.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateScreen(
      title: 'Scrren One',
      content: Center(
        child: Text('This is Screen One'),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const TemplateScreen(
        title: 'Screen Two',
        content: Center(
          child: Text('This is screen two'),
        ));
  }
}
