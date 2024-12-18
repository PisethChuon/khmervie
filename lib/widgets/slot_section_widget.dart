import 'package:flutter/material.dart';

class SlotSection extends StatelessWidget {
  final String title;
  final List<String> times;

  const SlotSection({
    super.key,
    required this.title,
    required this.times,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: times.map((time) => Chip(label: Text(time))).toList(),
          ),
        ],
      ),
    );
  }
}

class MorningSlots extends StatelessWidget {
  const MorningSlots({super.key});

  @override
  Widget build(BuildContext context) {
    return SlotSection(
      title: 'Morning Slots',
      times: List.generate(5, (index) => '${index + 7}:00 AM'),
    );
  }
}

class AfternoonSlots extends StatelessWidget {
  const AfternoonSlots({super.key});

  @override
  Widget build(BuildContext context) {
    return SlotSection(
      title: 'Afternoon Slots',
      times: List.generate(5, (index) => '${index + 1}:00 PM'),
    );
  }
}

class EveningSlots extends StatelessWidget {
  const EveningSlots({super.key});

  @override
  Widget build(BuildContext context) {
    return SlotSection(
      title: 'Evening Slots',
      times: List.generate(3, (index) => '${index + 6}:00 PM'),
    );
  }
}