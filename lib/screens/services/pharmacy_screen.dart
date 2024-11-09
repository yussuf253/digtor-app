import 'package:flutter/material.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

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
          'Pharmacy',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Barre de recherche
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey[400]),
                const SizedBox(width: 12),
                Text(
                  'Search medicines, pharmacy...',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Catégories
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryCard(
                  icon: Icons.medication,
                  label: 'Medicine',
                  color: Colors.blue,
                ),
                _buildCategoryCard(
                  icon: Icons.healing,
                  label: 'Vitamins',
                  color: Colors.orange,
                ),
                _buildCategoryCard(
                  icon: Icons.sanitizer,
                  label: 'Personal Care',
                  color: Colors.purple,
                ),
                _buildCategoryCard(
                  icon: Icons.baby_changing_station,
                  label: 'Baby Care',
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Pharmacies à proximité
          const Text(
            'Nearby Pharmacies',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          _buildPharmacyCard(
            name: 'HealthCare Pharmacy',
            address: '123 Medical Street',
            distance: '500m away',
            isOpen: true,
            rating: 4.8,
          ),
          const SizedBox(height: 16),
          _buildPharmacyCard(
            name: 'MediPlus Drugstore',
            address: '456 Health Avenue',
            distance: '1.2km away',
            isOpen: true,
            rating: 4.5,
          ),
          const SizedBox(height: 16),
          _buildPharmacyCard(
            name: 'City Pharmacy',
            address: '789 Care Road',
            distance: '2.1km away',
            isOpen: false,
            rating: 4.6,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
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
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPharmacyCard({
    required String name,
    required String address,
    required String distance,
    required bool isOpen,
    required double rating,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isOpen ? Colors.green[50] : Colors.red[50],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isOpen ? 'Open' : 'Closed',
                  style: TextStyle(
                    color: isOpen ? Colors.green[700] : Colors.red[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            address,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber[400],
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
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
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
