import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key, required this.onMonthChanged});
  final Function(String) onMonthChanged;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selectedIndex = 0;

  // Calendar data
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Th', 'Fri', 'Sat'];
  List<String> dates = [];

  // Declare variables
  final ScrollController _scrollController = ScrollController();
  String currentMonth = '';

  @override
  void initState() {
    super.initState();
    _generate30DayCycleDates();
    _scrollController.addListener(_onScroll);

    setState(() {
      currentMonth =
          '${_monthName(DateTime.now().month)} ${DateTime.now().year}';
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Estimate the visible index based on the scroll offset
  void _onScroll() {
    int visibleIndex = (_scrollController.offset / 80).floor();
    if (visibleIndex >= 0 && visibleIndex < dates.length) {
      String newMonth = _getMonthFromIndex(visibleIndex);
      if (newMonth != currentMonth) {
        HapticFeedback.lightImpact();

        setState(() {
          // _previousMonth = currentMonth;
          currentMonth = newMonth;
        });
        widget.onMonthChanged(currentMonth);
      }
    }
  }

  // Calculate the corresponding date and month
  String _getMonthFromIndex(int index) {
    DateTime now = DateTime.now();
    DateTime date = now.add(Duration(days: index));
    return '${_monthName(date.month)} ${date.year}';
  }

  // Convert month number to name
  String _monthName(int month) {
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }

  // Generate 30 consecutive days starting from today
  void _generate30DayCycleDates() {
    DateTime now = DateTime.now();
    List<String> newDates = [];

    for (int i = 0; i < 30; i++) {
      DateTime date = now.add(Duration(days: i));
      String dateFormatted = date.day.toString().padLeft(2, '0');

      newDates.add(dateFormatted);
    }

    setState(() {
      dates = newDates;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dates.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              DateTime now = DateTime.now();
              DateTime date = now.add(Duration(days: index));

              String dayName = days[date.weekday % 7];
              bool isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dates[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
