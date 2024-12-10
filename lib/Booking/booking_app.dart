import 'package:flutter/material.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  @override
  DateTime _selectedDate = DateTime.now();

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  List<Widget> _buildDaysOfWeek() {
    const daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return daysOfWeek
        .map((day) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ))
        .toList();
  }

  List<Widget> _buildCalendarDates(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final startingWeekday = firstDayOfMonth.weekday % 7;

    List<Widget> dateWidgets = [];
    int dayCounter = 1;

    for (int i = 0; i < startingWeekday; i++) {
      dateWidgets.add(const SizedBox());
    }

    for (int i = 1; i <= daysInMonth; i++) {
      final currentDate = DateTime(month.year, month.month, i);
      dateWidgets.add(
        GestureDetector(
          onTap: () => _onDateSelected(currentDate),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: _selectedDate == currentDate
                  ? Colors.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              i.toString(),
              style: TextStyle(
                  color: _selectedDate == currentDate
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      );
    }

    return dateWidgets;
  }

  Widget build(BuildContext context) {
    final today = DateTime.now();
    final currentMonth = DateTime(today.year, today.month);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildDaysOfWeek(),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7,
              children: _buildCalendarDates(currentMonth),
            ),
          ),
        ],
      ),
    );
  }
}
