import 'package:flutter/material.dart';

class SlotSection extends StatefulWidget {
  final String title;
  final List<String> times;

  const SlotSection({
    super.key,
    required this.title,
    required this.times,
  });

  @override
  State<SlotSection> createState() => _SlotSectionState();
}

class _SlotSectionState extends State<SlotSection> {
  Map<String, bool> selectedTimes = {};
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8.0,
              runSpacing: 4.0,
              children: widget.times.map((time) {
                bool isSelected = selectedTimes[time] ?? false;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTimes[time] = !isSelected;
                    });
                  },
                  child: Chip(
                    label: Text(time),
                    backgroundColor: isSelected ? Colors.green : Colors.white,
                  ),
                );
              }).toList(),
            ),
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
      times: List.generate(2, (index) => '${index + 1}:00 PM'),
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
