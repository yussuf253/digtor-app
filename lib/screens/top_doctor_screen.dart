import 'package:flutter/material.dart';
import '../widgets/doctor/doctor_card.dart';

class TopDoctorScreen extends StatelessWidget {
  const TopDoctorScreen({super.key});

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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          DoctorCard(
            name: 'Dr. Marcus Horizon',
            specialty: 'Chardiologist',
            distance: '800m away',
            rating: 4.7,
          ),
          SizedBox(height: 16),
          DoctorCard(
            name: 'Dr. Maria Elena',
            specialty: 'Psychologist',
            distance: '1.2km away',
            rating: 4.9,
          ),
          SizedBox(height: 16),
          DoctorCard(
            name: 'Dr. John Smith',
            specialty: 'Pediatrician',
            distance: '2km away',
            rating: 4.8,
          ),
          SizedBox(height: 16),
          DoctorCard(
            name: 'Dr. Sarah Johnson',
            specialty: 'Dermatologist',
            distance: '1.5km away',
            rating: 4.6,
          ),
        ],
      ),
    );
  }
}
