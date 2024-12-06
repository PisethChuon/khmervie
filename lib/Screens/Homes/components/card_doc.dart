import 'package:Khmervie/Booking/show_modal_bottom.dart';
import 'package:Khmervie/Screens/Category_Test.dart/dcotor_profile.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  DoctorList({super.key});

  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Vincenzo Casano",
      "experience": "15 Years Experience",
      "image": "assets/icons/Doctor_1.png",
      "rating": 5.0,
    },
    {
      "name": "Dr. Emily Carter",
      "experience": "12 Years Experience",
      "image": "assets/icons/Doctor_1.png",
      "rating": 3.0,
    },
    {
      "name": "Dr. Jhon Dens",
      "experience": "7 Years Experience",
      "image": "assets/icons/Doctor_1.png",
      "rating": 2.0,
    },
    {
      "name": "Dr. Jhon Samit",
      "experience": "20 Years Experience",
      "image": "assets/icons/Doctor_1.png",
      "rating": 5.0,
    },
    {
      "name": "Dr. Dong Don",
      "experience": "6 Years Experience",
      "image": "assets/icons/Doctor_1.png",
      "rating": 2.0,
    },
    {
      "name": "Dr. Rash Meash",
      "experience": "5 Years Experience",
      "image": "assets/icons/Doctor_1.png",
      "rating": 4.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length, // Add itemCount
      itemBuilder: (context, index) {
        final doctor = doctors[index];
        return DoctorCard(
          name: doctor["name"],
          experience: doctor["experience"],
          image: doctor["image"],
          rating: doctor["rating"],
        );
      },
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.name,
    required this.image,
    required this.experience,
    required this.rating,
  });

  final String name;
  final String experience;
  final String image;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DoctorProfileScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(image),
                          backgroundColor: Colors.white,
                          radius: 30,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 16),
                  // Doctor name and experience
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
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

              const SizedBox(height: 16),
              // Rating and button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating.floor()
                            ? Icons.star
                            : index < rating
                                ? Icons.star_half
                                : Icons.star_border,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                  ),

                  // Booking Bottom
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      ShowModalBottom.display(context);
                    },
                    child: const Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}