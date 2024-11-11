import 'package:flutter/material.dart';
import '../../screens/doctor_profile_screen.dart';
import '../../screens/top_doctor_screen.dart';
import '../doctor/doctor_card.dart';

class TopDoctorsSection extends StatelessWidget {
  const TopDoctorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Doctor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TopDoctorScreen(),
                    ),
                  );
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DoctorCard(
            name: 'Dr. Marcus Horizon',
            specialty: 'Chardiologist',
            distance: '800m away',
            rating: 4.7,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorProfileScreen(
                    name: 'Dr. Marcus Horizon',
                    specialty: 'Chardiologist',
                    rating: 4.7,
                    distance: '800m away',
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          DoctorCard(
            name: 'Dr. Maria Elena',
            specialty: 'Psychologist',
            distance: '1.2km away',
            rating: 4.9,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorProfileScreen(
                    name: 'Dr. Maria Elena',
                    specialty: 'Psychologist',
                    rating: 4.9,
                    distance: '1.2km away',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
