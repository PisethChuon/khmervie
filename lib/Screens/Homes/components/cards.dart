import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  // Sample data for doctors
  final List<Map<String, dynamic>> doctors = List.generate(
    10,
    (index) => {
      "name": "Dr. John Doe ${index + 1}",
      "experience": "${5 + index} Years Experience",
      "image":
          "https://via.placeholder.com/150", // Replace with actual URLs if available
      "rating": 5, // Replace with dynamic rating if needed
    },
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(
          name: doctor["name"],
          experience: doctor["experience"],
          imageUrl: doctor["image"],
          rating: doctor["rating"],
        );
      },
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String experience;
  final String imageUrl;
  final int rating;

  DoctorCard({
    required this.name,
    required this.experience,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Doctor's profile image
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(width: 16),
                // Doctor's name and experience
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      experience,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Rating
            Row(
              children: List.generate(
                rating,
                (index) => Icon(
                  Icons.star,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Book Now button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Handle book now action
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Booked appointment for $name'),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Book Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}