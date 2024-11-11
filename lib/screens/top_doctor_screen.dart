import 'package:flutter/material.dart';
import '../widgets/doctor/doctor_card.dart';
import 'search_screen.dart';
import 'doctor_profile_screen.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

  final List<Map<String, dynamic>> _doctors = const [
    {
      'name': 'Dr. Marcus Horizon',
      'specialty': 'Chardiologist',
      'distance': '800m away',
      'rating': 4.7,
    },
    {
      'name': 'Dr. Maria Elena',
      'specialty': 'Psychologist',
      'distance': '1.2km away',
      'rating': 4.9,
    },
    {
      'name': 'Dr. John Smith',
      'specialty': 'Dentist',
      'distance': '2.1km away',
      'rating': 4.8,
    },
    {
      'name': 'Dr. Sarah Wilson',
      'specialty': 'Pediatrician',
      'distance': '1.5km away',
      'rating': 4.6,
    },
    {
      'name': 'Dr. Michael Brown',
      'specialty': 'Neurologist',
      'distance': '3.0km away',
      'rating': 4.5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Top Doctors',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(
                      initialSearchType: 'doctors',
                    ),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey[400], size: 22),
                    const SizedBox(width: 12),
                    Text(
                      'Search doctor...',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _doctors.length,
              itemBuilder: (context, index) {
                final doctor = _doctors[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: DoctorCard(
                    name: doctor['name'],
                    specialty: doctor['specialty'],
                    distance: doctor['distance'],
                    rating: doctor['rating'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorProfileScreen(
                            name: doctor['name'],
                            specialty: doctor['specialty'],
                            rating: doctor['rating'],
                            distance: doctor['distance'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
