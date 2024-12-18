import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarWidget extends StatefulWidget {
  final Function(int) onDateSelected;

  const CalendarWidget({super.key, required this.onDateSelected});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Th', 'Fri', 'Sat'];
  List<String> dates = [];
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  String currentMonth = '';

  @override
  void initState() {
    super.initState();
    _generate30DayCycleDates();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _generate30DayCycleDates() {
    DateTime now = DateTime.now();
    List<String> newDates = [];

    for (int i = 0; i < 30; i++) {
      DateTime date = now.add(Duration(days: i));
      int dayIndex = date.weekday == 7 ? 0 : date.weekday;
      String dayName = days[dayIndex];      
      String dateFormatted = date.day.toString().padLeft(2, '0');
      newDates.add(dateFormatted);
    }

    setState(() {
      dates = newDates;
    });
  }

  void _onScroll() {
  int visibleIndex = (_scrollController.offset / 80).floor();  // Determine the visible index based on the scroll offset
  if (visibleIndex >= 0 && visibleIndex < dates.length) {
    String newMonth = _getMonthFromIndex(visibleIndex);  // Get the month from the visible index
    if (newMonth != currentMonth) {  // Only update if the month has changed
      HapticFeedback.lightImpact();  // Provide haptic feedback
      setState(() {
        currentMonth = newMonth;  // Update the displayed month
      });
    }
  }
}


  String _getMonthFromIndex(int index) {
  DateTime now = DateTime.now();
  DateTime date = now.add(Duration(days: index));  // Calculate the date based on the index
  return '${_monthName(date.month)} ${date.year}';  // Format the month and year
}


  String _monthName(int month) {
    final monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June', 
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
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
                  widget.onDateSelected(index);
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