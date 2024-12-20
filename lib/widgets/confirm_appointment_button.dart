import 'package:flutter/material.dart';

class ConfirmAppointmentButton extends StatelessWidget {
  const ConfirmAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Confirm Appoitment',
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
