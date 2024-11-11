import 'package:flutter/material.dart';
import '../../widgets/pharmacy/pharmacy_list_card.dart';
import '../../widgets/pharmacy/popular_medicine_card.dart';
import '../medicine/medicine_category_screen.dart';
import '../pharmacy/pharmacy_medicines_screen.dart';
import '../cart/cart_screen.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  // Données des catégories
  final List<Map<String, dynamic>> _categories = const [
    {
      'name': 'Pain Relief',
      'icon': Icons.healing,
      'color': Colors.blue,
    },
    {
      'name': 'Antibiotics',
      'icon': Icons.medical_services,
      'color': Colors.green,
    },
    {
      'name': 'Vitamins',
      'icon': Icons.medication,
      'color': Colors.orange,
    },
    {
      'name': 'First Aid',
      'icon': Icons.local_hospital,
      'color': Colors.red,
    },
  ];

  // Données des médicaments populaires
  final List<Map<String, dynamic>> _popularMedicines = const [
    {
      'id': 'paracetamol-500',
      'name': 'Paracetamol',
      'type': 'Pain Relief',
      'description': 'Effective pain reliever for mild to moderate pain.',
      'price': '\$5.99',
      'icon': Icons.healing,
      'color': Colors.blue,
      'rating': '4.8',
      'reviews': '128',
      'inStock': 'Yes',
    },
    {
      'id': 'amoxicillin-500',
      'name': 'Amoxicillin',
      'type': 'Antibiotics',
      'description': 'Broad-spectrum antibiotic for bacterial infections.',
      'price': '\$12.99',
      'icon': Icons.medical_services,
      'color': Colors.green,
      'rating': '4.5',
      'reviews': '256',
      'inStock': 'Yes',
    },
    {
      'id': 'vitamin-c-1000',
      'name': 'Vitamin C',
      'type': 'Supplements',
      'description': 'Supports immune system health.',
      'price': '\$8.99',
      'icon': Icons.medication,
      'color': Colors.orange,
      'rating': '4.7',
      'reviews': '192',
      'inStock': 'Yes',
    },
  ];

  // Données des pharmacies
  final List<Map<String, dynamic>> _pharmacies = const [
    {
      'name': 'HealthCare Pharmacy',
      'address': '123 Main Street',
      'distance': '500m away',
      'rating': '4.8',
      'status': 'Open',
    },
    {
      'name': 'MediCare Plus',
      'address': '456 Oak Avenue',
      'distance': '1.2km away',
      'rating': '4.5',
      'status': 'Open',
    },
    {
      'name': 'City Pharmacy',
      'address': '789 Pine Road',
      'distance': '2.1km away',
      'rating': '4.2',
      'status': 'Closed',
    },
  ];

  void _navigateToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête avec barre de recherche
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Find your',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Medicines',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_cart_outlined),
                          onPressed: () => _navigateToCart(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Barre de recherche
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/search'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey[600]),
                            const SizedBox(width: 12),
                            Text(
                              'Search medicines...',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Catégories horizontales avec icônes
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicineCategoryScreen(
                                category: category['name'],
                                color: category['color'],
                                icon: category['icon'],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: category['color'].withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                category['icon'],
                                color: category['color'],
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              category['name'],
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Section des médicaments populaires
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular Medicines',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigation vers tous les médicaments populaires
                          },
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _popularMedicines.length,
                        itemBuilder: (context, index) {
                          final medicine = _popularMedicines[index];
                          return PopularMedicineCard(
                            id: medicine['id'],
                            name: medicine['name'],
                            type: medicine['type'],
                            description: medicine['description'],
                            price: medicine['price'],
                            icon: medicine['icon'],
                            color: medicine['color'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Section des pharmacies
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nearby Pharmacies',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigation vers toutes les pharmacies
                          },
                          child: const Text('See All'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _pharmacies.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final pharmacy = _pharmacies[index];
                        return PharmacyListCard(
                          name: pharmacy['name'],
                          status: pharmacy['status'],
                          distance: pharmacy['distance'],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PharmacyMedicinesScreen(
                                  pharmacyName: pharmacy['name'],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
