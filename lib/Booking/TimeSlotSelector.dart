import 'package:flutter/material.dart';

class TimeSlotSelector extends StatelessWidget {
  final List<String> timeSlots;
  final List<String> bookedSlots;
  final Function(String) onSlotSelected;

  TimeSlotSelector(
      {required this.timeSlots, required this.bookedSlots, required this.onSlotSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: timeSlots.map((slot) {
        final isBooked = bookedSlots.contains(slot);
        return GestureDetector(
          onTap: isBooked ? null : () => onSlotSelected(slot),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isBooked ? Colors.red : Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              slot,
              style: TextStyle(color: isBooked ? Colors.white : Colors.black),
            ),
          ),
        );
      }).toList(),
    );
  }
}
