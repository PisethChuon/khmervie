import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.location_on,
          color: Colors.black,
          size: 24,
        ),
        SizedBox(width: 10),
        Text(
          'Khan Russey Keo',
          style: TextStyle(
              fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.navigate_next_sharp,
          size: 24,
          color: Colors.black,
        ),
      ],
    );
  }
}
