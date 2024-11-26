import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  DoctorList({super.key});

  // Dynamic data for doctors
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Emily Carter",
      "experience": "12 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 4,
    },
    {
      "name": "Dr. Michael Smith",
      "experience": "8 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 5,
    },
    {
      "name": "Dr. Olivia Johnson",
      "experience": "10 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 3,
    },
    {
      "name": "Dr. James Anderson",
      "experience": "6 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 5,
    },
    {
      "name": "Dr. Sophia Martinez",
      "experience": "15 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 4,
    },
    {
      "name": "Dr. William Brown",
      "experience": "9 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 4,
    },
    {
      "name": "Dr. Mia Wilson",
      "experience": "7 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 5,
    },
    {
      "name": "Dr. Ethan Davis",
      "experience": "11 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 3,
    },
    {
      "name": "Dr. Ava Garcia",
      "experience": "13 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 5,
    },
    {
      "name": "Dr. Noah Wilson",
      "experience": "5 Years Experience",
      "image": "https://via.placeholder.com/150",
      "rating": 4,
    },
  ];

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

  const DoctorCard({
    Key? key,
    required this.name,
    required this.experience,
    required this.imageUrl,
    required this.rating,
  }) : super(key: key);

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
