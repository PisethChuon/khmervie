import 'package:flutter/material.dart';
import 'package:Khmervie/Utils/util.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  @override
  DateTime _selectedDate = DateTime.now();
  DateTime _currentMonth = DateTime.now();

// On Date Seleted
  void _onDateSelected(DateTime date) {
    final today = DateTime.now();
    final thirtyDaysLater =
        today.add(const Duration(days: 30)); // 30 days from today

    // Check if the selected date is within the range from today to 30 days later
    if (date.isAfter(today.subtract(const Duration(days: 1))) &&
        date.isBefore(thirtyDaysLater.add(const Duration(days: 1)))) {
      setState(() {
        _selectedDate = date; // Update only for valid dates
      });
    } else {
      // Show a message for invalid date selection
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You can only select today and the next 30 days!'),
        ),
      );
    }
  }

  void _changeMonth(int delta) {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + delta);
    });
  }

  List<Widget> _buildDaysOfWeek() {
    const daysOfWeek = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return daysOfWeek
        .map(
          (day) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        )
        .toList();
  }

  List<Widget> _buildCalendarDates(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final startingWeekday = firstDayOfMonth.weekday % 7;

    final today = DateTime.now(); // Get today's date

    List<Widget> dateWidgets = [];
    int dayCounter = 1;

    for (int i = 0; i < startingWeekday; i++) {
      dateWidgets.add(const SizedBox());
    }

    for (int i = 1; i <= daysInMonth; i++) {
      final currentDate = DateTime(month.year, month.month, i);
      final isToday = today.year == currentDate.year &&
          today.month == currentDate.month &&
          today.day == currentDate.day;

      dateWidgets.add(
        GestureDetector(
          onTap: () => _onDateSelected(currentDate),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: _selectedDate == currentDate
                  ? Colors.green // Seleted date
                  : isToday
                      ? Colors.blue
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              i.toString(),
              style: TextStyle(
                color: _selectedDate == currentDate
                    ? Colors.white // Text color for selected date
                    : isToday
                        ? Colors.white
                        : Colors.black,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: const Icon(Icons.chevron_left),
              ),
              Text(
                "${_currentMonth.year} - ${MyDateUtils.monthNames[_currentMonth.month - 1]}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
          const SizedBox(
            height: 24.0,
          ),
          // Display Calendar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildDaysOfWeek(),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _buildCalendarDates(_currentMonth).length,
              itemBuilder: (context, index) =>
                  _buildCalendarDates(_currentMonth)[index],
            ),
          ),
        ],
      ),
    );
  }
}
