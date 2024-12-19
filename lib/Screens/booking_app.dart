import 'package:Khmervie/widgets/calendar_widget.dart';
import 'package:Khmervie/widgets/confirm_appointment_button.dart';
import 'package:Khmervie/widgets/slot_section_widget.dart';
import 'package:flutter/material.dart';

class BookingApp extends StatefulWidget {
  const BookingApp({super.key});

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  // Declare variables
  String currentMonth = '';

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
            CalendarWidget(onMonthChanged: (month) {
              setState(() {
                currentMonth = month;
              });
            }),
            const MorningSlots(),
            const AfternoonSlots(),
            const EveningSlots(),
            const ConfirmAppointmentButton(),
          ],
        ),
      ),
    );
  }
}
