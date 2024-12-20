import 'package:flutter/material.dart';

class ConfirmAppointmentButton extends StatelessWidget {
  const ConfirmAppointmentButton({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ElevatedButton(
    //     onPressed: () {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(content: Text('Appointment Confirmation Pressed')),
    //       );
    //     },
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: Colors.green,
    //       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8.0),
    //       ),
    //     ),
    //     child: const Text(
    //       'Confirm Appointment',
    //       style: TextStyle(
    //         fontSize: 16.0,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // );
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Confirm Appoitment',
          style: TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
