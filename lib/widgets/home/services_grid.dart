import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../screens/services/ambulance_screen.dart';
import '../../screens/services/hospital_screen.dart';
import '../../screens/services/pharmacy_screen.dart';
import '../../screens/top_doctor_screen.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: AppStyles.titleLarge,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildServiceItem(
              context,
              Icons.medical_services_outlined,
              'Doctor',
              AppColors.primary,
              const TopDoctorScreen(),
            ),
            _buildServiceItem(
              context,
              Icons.local_pharmacy_outlined,
              'Pharmacy',
              AppColors.secondary,
              const PharmacyScreen(),
            ),
            _buildServiceItem(
              context,
              Icons.local_hospital_outlined,
              'Hospital',
              AppColors.info,
              const HospitalScreen(),
            ),
            _buildServiceItem(
              context,
              Icons.airport_shuttle_outlined,
              'Ambulance',
              AppColors.error,
              const AmbulanceScreen(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceItem(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    Widget destination,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppStyles.labelLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
