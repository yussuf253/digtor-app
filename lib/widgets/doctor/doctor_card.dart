import 'package:flutter/material.dart';

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
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[100]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100]!,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Photo du docteur
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                image: imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: imageUrl == null
                  ? Icon(
                      Icons.person,
                      color: Colors.blue[300],
                      size: 30,
                    )
                  : null,
            ),
            const SizedBox(width: 12),

            // Informations du docteur
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Rating
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: Colors.amber[600],
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.amber[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Distance
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey[400],
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            distance,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
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
