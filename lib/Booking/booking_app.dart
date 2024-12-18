import 'package:flutter/material.dart';
import 'package:Khmervie/Utils/util.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  String dropdownValue = 'December';

  // Calendar data
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Th', 'Fri', 'Sat'];
  List<String> dates = [];

  // Declear varialble
  final ScrollController _scrollController = ScrollController();
  String currentMonth = '';

  // Maintenant state
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

  // Estimate the visible index based on the scroll offset
  void _onScroll() {
    int visibleIndex = (_scrollController.offset / 80).floor();
    if (visibleIndex >= 0 && visibleIndex < dates.length) {
      String newMonth = _getMonthFromIndex(visibleIndex);
      if (newMonth != currentMonth) {
        setState(() {
          currentMonth = newMonth;
        });
      }
    }
  }

  // Calculate the corresponding date and month
  String _getMonthFromIndex(int index) {
    DateTime now = DateTime.now();
    DateTime date = now.add(Duration(days: index));
    return '${_monthName(date.month)} ${(date.year)}';
  }

  _monthName(int month) {
    // Convert month number to name
    List<String> monthNames = [
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

  // Generate the dates for the current month dynamically
  void _generate30DayCycleDates() {
    DateTime now = DateTime.now();
    List<String> newDates = [];

    // Generate 30 consecutive days starting from today
    for (int i = 0; i < 30; i++) {
      DateTime date =
          now.add(Duration(days: i)); // Add 'i' days to the current day
      String day = days[date.weekday % 7]; // Get day name (Sun, Mon, ...)
      String dateFormatted = "${date.day.toString().padLeft(2, '0')}";

      newDates.add("$dateFormatted"); // Combine day name and date
    }

    setState(() {
      dates = newDates; // Update the list with 30 days
    });
  }

  int isSelectedDayIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentMonth.isEmpty ? 'Loading...' : currentMonth,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),

            ),
            ),

          const SizedBox(height: 16.0),
          _buildCalendar(),
          const SizedBox(height: 8.0),
          _morningSlots(),
          const SizedBox(height: 8.0),
          _afternoonSlots(),
          const SizedBox(height: 8.0),
          _eveningSlots(),
          const SizedBox(height: 16.0),
          // _confirmAppointment(),
        ],
      ),
    );
  }

  // Widget for the calendar
  int? selectedIndex;
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
              int dayNumber = int.parse(dates[index]);
              String dayName = days[
                  DateTime(DateTime.now().year, DateTime.now().month, dayNumber)
                          .weekday %
                      7];

              bool isSelected =
                  selectedIndex == index; // Check if the date is selected

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // Update the selected date
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.green // Green background for selected date
                        : Colors
                            .transparent, // Transparent background for unselected
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dayName,
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.black, // White text on selected
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dates[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.black, // White text on selected
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

  // Slot Section Template
  Widget _confirmAppointment() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // TODO: Implement appointment confirmation logic
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Appointment Confirmation Pressed')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green, // Set the button color to green
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 12.0), // Add padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        child: const Text(
          'Confirm Appointment',
          style: TextStyle(
            fontSize: 16.0, // Font size
            fontWeight: FontWeight.bold, // Bold text
            color: Colors.white, // Text color
          ),
        ),
      ),
    );
  }
}
