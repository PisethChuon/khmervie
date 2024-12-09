import 'package:flutter/material.dart';

class BookingCalendarApp extends StatefulWidget {
  const BookingCalendarApp({super.key});

  @override
  State<BookingCalendarApp> createState() => _BookingCalendarStateApp();
}

class _BookingCalendarStateApp extends State<BookingCalendarApp> {
  // Local time zone
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Calendar Booking'),
      ),
      body: Column(
        children: [
          // Calendar header
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              // '${selectedDate.year}-${selectedDate.month}',
              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Calendar grid
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: _getDaysInMonth(selectedDate),
                itemBuilder: (context, index) {
                  final date = _getDateForIndex(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = date;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: date.day == selectedDate.day
                            ? Colors.blue
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                            color: date.day == selectedDate.day
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

// Get the number of days in the current month
  int _getDaysInMonth(DateTime date) {
    final firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayOfNextMonth.subtract(const Duration(days: 1)).day;
  }

// Get the actual date object for a specific index
  DateTime _getDateForIndex(int index) {
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    return firstDayOfMonth.add(Duration(days: index));
  }
}
