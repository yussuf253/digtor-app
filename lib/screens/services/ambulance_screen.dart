import 'package:flutter/material.dart';
import 'service_base_screen.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ServiceBaseScreen(
      title: 'Ambulance',
      icon: Icons.airport_shuttle_outlined,
      iconColor: const Color(0xFF4894FE),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Emergency Call Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red[100]!),
            ),
            child: Column(
              children: [
                const Text(
                  'Emergency',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Action pour appeler l'ambulance
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.phone, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Call Ambulance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Nearby Ambulances
          const Text(
            'Available Ambulances',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Liste des ambulances disponibles
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildAmbulanceCard(
                id: 'AMB-${1001 + index}',
                distance: '${(index + 1) * 100}m away',
                isAvailable:
                    index != 1, // Pour montrer certaines non disponibles
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAmbulanceCard({
    required String id,
    required String distance,
    required bool isAvailable,
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
              Icons.airport_shuttle,
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
                  'Ambulance $id',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
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
                        color: isAvailable ? Colors.green[50] : Colors.red[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        isAvailable ? 'Available' : 'On duty',
                        style: TextStyle(
                          color: isAvailable ? Colors.green : Colors.red,
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
