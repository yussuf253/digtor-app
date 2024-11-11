import 'package:flutter/material.dart';
import '../../models/medicine.dart';

import '../../widgets/pharmacy/medicine_card.dart';
import '../cart/cart_screen.dart';

class PharmacyMedicinesScreen extends StatefulWidget {
  final String pharmacyName;

  const PharmacyMedicinesScreen({
    super.key,
    required this.pharmacyName,
  });

  @override
  State<PharmacyMedicinesScreen> createState() =>
      _PharmacyMedicinesScreenState();
}

class _PharmacyMedicinesScreenState extends State<PharmacyMedicinesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  String selectedCategory = 'All';

  // Exemple de données (à remplacer par vos vraies données)
  final List<Medicine> allMedicines = [
    Medicine(
      id: 'paracetamol-500',
      name: 'Paracetamol',
      category: 'Pain Relief',
      description: 'Effective pain reliever for mild to moderate pain.',
      price: '\$5.99',
      icon: Icons.healing,
      color: Colors.blue,
    ),
    Medicine(
      id: 'amoxicillin-500',
      name: 'Amoxicillin',
      category: 'Antibiotics',
      description: 'Broad-spectrum antibiotic for bacterial infections.',
      price: '\$12.99',
      icon: Icons.medical_services,
      color: Colors.green,
    ),
    Medicine(
      id: 'vitamin-c-1000',
      name: 'Vitamin C',
      category: 'Vitamins',
      description: 'Supports immune system health.',
      price: '\$8.99',
      icon: Icons.medication,
      color: Colors.orange,
    ),
    Medicine(
      id: 'bandage-roll',
      name: 'Bandage Roll',
      category: 'First Aid',
      description: 'Sterile bandage for wound care.',
      price: '\$3.99',
      icon: Icons.local_hospital,
      color: Colors.red,
    ),
  ];

  void _navigateToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    );
  }

  // Obtenir toutes les catégories uniques
  List<String> get categories {
    final Set<String> cats = allMedicines.map((m) => m.category).toSet();
    return ['All', ...cats];
  }

  // Filtrer les médicaments
  List<Medicine> get filteredMedicines {
    return allMedicines.where((medicine) {
      final matchesCategory =
          selectedCategory == 'All' || medicine.category == selectedCategory;
      final matchesSearch =
          medicine.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
              medicine.description
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pharmacyName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${filteredMedicines.length} medicines available',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () => _navigateToCart(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // Barre de recherche
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Search medicines...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => searchQuery = '');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
              ),
            ),
          ),

          // Filtres de catégorie
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() => selectedCategory = category);
                    },
                    backgroundColor: Colors.grey[100],
                    selectedColor: Colors.blue.withOpacity(0.2),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.blue : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.transparent,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Liste des médicaments
          Expanded(
            child: filteredMedicines.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medication_outlined,
                          size: 100,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No medicines found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredMedicines.length,
                    itemBuilder: (context, index) {
                      final medicine = filteredMedicines[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: MedicineCard(
                          id: medicine.id,
                          name: medicine.name,
                          type: medicine.category,
                          description: medicine.description,
                          price: medicine.price,
                          icon: medicine.icon,
                          color: medicine.color,
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
