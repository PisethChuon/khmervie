import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  String dropdownValue = 'December';
  int selectedIndex = 0; // Added selectedIndex
  // String _previousMonth = '';

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
      int dayIndex = date.weekday == 7 ? 0 : date.weekday;
      String dayName = days[dayIndex];
      String dateFormatted = date.day.toString().padLeft(2, '0');

      newDates.add(dateFormatted);
    }

    setState(() {
      dates = newDates;
    });
  }

  // Display content
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentMonth),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCalendar(),
            _morningSlots(),
            _afternoonSlots(),
            _eveningSlots(),
            _confirmAppointment(),
          ],
        ),
      ),
    );
  }

  // Build Calendar
  Widget _buildCalendar() {
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

  Widget _slotSection({required String title, required List<String> times}) {
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

  // Morning Slots
  Widget _morningSlots() {
    return _slotSection(
      title: 'Morning Slots',
      times: List.generate(5, (index) => '${index + 7}:00 AM'),
    );
  }

  // Afternoon Slots
  Widget _afternoonSlots() {
    return _slotSection(
      title: 'Afternoon Slots',
      times: List.generate(5, (index) => '${index + 1}:00 PM'),
    );
  }

  // Evening Slots
  Widget _eveningSlots() {
    return _slotSection(
      title: 'Evening Slots',
      times: List.generate(3, (index) => '${index + 6}:00 PM'),
    );
  }

  // Confirm Appointment
  Widget _confirmAppointment() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Appointment Confirmation Pressed')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Confirm Appointment',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}