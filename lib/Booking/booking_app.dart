import 'package:flutter/material.dart';
import 'package:Khmervie/Utils/util.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  String dropdownValue = 'December';

  // Dropdown menu options
  final List<String> months = ['December', 'January'];

  // Calendar data
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Th', 'Fri', 'Sat'];
  final List<String> dates = ['01', '02', '03', '04', '05', '06', '07', '08'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDropdownMenu(),
          const SizedBox(height: 16),
          _buildCalendar(),
          const SizedBox(height: 16),
          _morningSlots(),
        ],
      ),
    );
  }

  // Widget for the dropdown menu
  Widget _buildDropdownMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        items: months.map((String month) {
          return DropdownMenuItem(
            value: month,
            child: Text(month),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
      ),
    );
  }

  // Widget for the calendar
  Widget _buildCalendar() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          final isSelected = index == 2; // Highlight the first item as default

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 60,
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  days[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dates[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget for Morning Slots
  Widget _morningSlots() {
    return const Padding(
        padding: EdgeInsets.all(8.0), child: Chip(label: Text('10.10 AM')));
  }
}
