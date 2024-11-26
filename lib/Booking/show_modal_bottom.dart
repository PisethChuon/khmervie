import 'package:Khmervie/Booking/content.dart';
import 'package:flutter/material.dart';

class ShowModalBottom {
  static void display(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return const SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // Widget
              children: <Widget>[
                ShowModalContent(),
              ],
            ),
          ),
        );
      },
    );
  }
}
