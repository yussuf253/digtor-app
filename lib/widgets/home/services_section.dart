import 'package:flutter/material.dart';

import '../../screens/services/ambulance_screen.dart';
import '../../screens/services/hospital_screen.dart';
import '../../screens/services/pharmacy_screen.dart';
import '../../screens/top_doctor_screen.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  void _navigateToScreen(BuildContext context, String label) {
    switch (label) {
      case 'Doctor':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TopDoctorScreen(),
          ),
        );
        break;
      case 'Pharmacy':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PharmacyScreen(),
          ),
        );
        break;
      case 'Hospital':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HospitalScreen(),
          ),
        );
        break;
      case 'Ambulance':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AmbulanceScreen(),
          ),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Navigating to $label screen'),
            duration: const Duration(seconds: 1),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildServiceItem(
            context,
            icon: Icons.medical_services_outlined,
            label: 'Doctor',
            color: Colors.blue[50]!,
            iconColor: Colors.blue[600]!,
          ),
          _buildServiceItem(
            context,
            icon: Icons.local_pharmacy_outlined,
            label: 'Pharmacy',
            color: Colors.green[50]!,
            iconColor: Colors.green[600]!,
          ),
          _buildServiceItem(
            context,
            icon: Icons.local_hospital_outlined,
            label: 'Hospital',
            color: Colors.orange[50]!,
            iconColor: Colors.orange[600]!,
          ),
          _buildServiceItem(
            context,
            icon: Icons.airport_shuttle_outlined,
            label: 'Ambulance',
            color: Colors.red[50]!,
            iconColor: Colors.red[600]!,
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () => _navigateToScreen(context, label),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
