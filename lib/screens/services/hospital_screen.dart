import 'package:flutter/material.dart';
import 'service_base_screen.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceBaseScreen(
      title: 'Hospital',
      icon: Icons.local_hospital_outlined,
      iconColor: const Color(0xFF4894FE),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Search hospital...',
              prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[200]!),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Nearby Hospitals
          const Text(
            'Nearby Hospitals',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Liste des hôpitaux
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildHospitalCard(
                name: 'General Hospital ${index + 1}',
                address: '123 Medical Center Street',
                distance: '${(index + 1) * 200}m away',
                isOpen: true, // Les hôpitaux sont toujours ouverts
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHospitalCard({
    required String name,
    required String address,
    required String distance,
    required bool isOpen,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.local_hospital,
              color: Color(0xFF4894FE),
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '24/7',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
