import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String distance;
  final String? imageUrl;
  final double rating;
  final VoidCallback? onTap;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.distance,
    this.imageUrl,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFFB800),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFB800),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(
                        Icons.location_on,
                        color: Colors.grey.shade400,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
