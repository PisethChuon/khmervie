import 'package:flutter/material.dart';
import 'package:Khmervie/Utils/util.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  @override
  String dropdownValue = 'December';

  // Calendar data
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Th', 'Fri', 'Sat'];
  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    _generateCurrentMonthDates();
  }

  // Generate the dates for the current month dynamically
  void _generateCurrentMonthDates() {    
    DateTime now = DateTime.now();
    int today = now.day;
    // DateTime firstDayOfMonth = DateTime(today.year, today.month, 1);
    int daysInMonth = _daysInMonth(now.year, now.month);

    // List to store the dates
    List<String> newDates = [];

    // Generate date strings for the current month
    for (int i = today; i <= daysInMonth; i++) {
      newDates.add(i.toString().padLeft(2, '0'));
    }

    setState(() {
      dates = newDates;
    });
  }

  // Helper function to get the number of days in a month
  int _daysInMonth(int year, int month) {
    switch (month) {
      case 2: 
        return (DateTime(year, month + 1, 0).day == 29) ? 29 : 28;
        case 4: case 6: case 9: case 11:
        return 30;
      default:
        return 31;
    }
  }

  int isSelectedDayIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apointment'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildDropdownMenu(),
          const SizedBox(height: 16.0),
          _buildCalendar(),
          // const SizedBox(height: 8.0),
          // _morningSlots(),
          // const SizedBox(height: 8.0),
          // _afternoonSlots(),
          // const SizedBox(height: 8.0),
          // _eveningSlots(),
          // const SizedBox(height: 16.0),
          // _confirmAppointment(),
        ],
      ),
    );
  }

  // Widget for the dropdown menu
  // Widget _buildDropdownMenu() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: DropdownButton<String>(
  //       value: dropdownValue,
  //       icon: const Icon(Icons.keyboard_arrow_down),
  //       items: months.map((String month) {
  //         return DropdownMenuItem(
  //           value: month,
  //           child: Text(month),
  //         );
  //       }).toList(),
  //       onChanged: (String? newValue) {
  //         setState(() {
  //           dropdownValue = newValue!;
  //         });
  //       },
  //     ),
  //   );
  // }

  // Widget for the calendar
  Widget _buildCalendar() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        
        itemBuilder: (context, index) {
          int dayNumber = int.parse(dates[index]);
          String dayName = days[DateTime(DateTime.now().year, DateTime.now().month, dayNumber).weekday % 7];
          return GestureDetector(
            onTap: () {
              // Handle date selection here
              print("Selected date: ${dates[index]}");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: 60,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dayName,  // Repeat days based on the current day of the week
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dates[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
      title: 'Afternoo Slots',
      times: List.generate(5, (index) => '${index + 1}: 00 PM'),
    );
  }

  // Evening Slots
  Widget _eveningSlots() {
    return _slotSection(
      title: 'Evening Slots',
      times: List.generate(3, (index) => '${index + 6}: 00 PM'),
    );
  }

  // Slot Section Template
  Widget _confirmAppointment() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
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
