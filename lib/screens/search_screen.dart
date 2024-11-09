import 'package:flutter/material.dart';
import '../widgets/doctor/doctor_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Données de démonstration
  final List<Map<String, dynamic>> _doctors = [
    {
      'name': 'Dr. Marcus Horizon',
      'specialty': 'Chardiologist',
      'distance': '800m away',
      'rating': 4.7,
    },
    {
      'name': 'Dr. Maria Elena',
      'specialty': 'Psychologist',
      'distance': '1.2km away',
      'rating': 4.9,
    },
  ];

  final List<Map<String, dynamic>> _hospitals = [
    {
      'name': 'Mount Sinai Hospital',
      'type': 'General Hospital',
      'distance': '1.5km away',
    },
    {
      'name': 'City Medical Center',
      'type': 'Medical Center',
      'distance': '2.3km away',
    },
  ];

  final List<Map<String, dynamic>> _pharmacies = [
    {
      'name': 'HealthCare Pharmacy',
      'status': 'Open 24/7',
      'distance': '500m away',
    },
    {
      'name': 'MediPlus Drugstore',
      'status': 'Open until 10 PM',
      'distance': '1.1km away',
    },
  ];

  final List<Map<String, dynamic>> _drugs = [
    {
      'name': 'Paracetamol',
      'category': 'Pain Relief',
      'price': '\$5.99',
    },
    {
      'name': 'Amoxicillin',
      'category': 'Antibiotics',
      'price': '\$12.99',
    },
  ];

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
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search doctor, drugs, articles...',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        actions: [
          if (_searchQuery.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear, color: Colors.black),
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchQuery = '';
                });
              },
            ),
        ],
      ),
      body: _searchQuery.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    size: 100,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Search for doctors, hospitals,\npharmacies, or drugs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildSearchResults(),
              ],
            ),
    );
  }

  Widget _buildSearchResults() {
    final query = _searchQuery.toLowerCase();

    // Filtrer les résultats
    final doctors = _doctors
        .where((d) =>
            d['name'].toString().toLowerCase().contains(query) ||
            d['specialty'].toString().toLowerCase().contains(query))
        .toList();

    final hospitals = _hospitals
        .where((h) =>
            h['name'].toString().toLowerCase().contains(query) ||
            h['type'].toString().toLowerCase().contains(query))
        .toList();

    final pharmacies = _pharmacies
        .where((p) =>
            p['name'].toString().toLowerCase().contains(query) ||
            p['status'].toString().toLowerCase().contains(query))
        .toList();

    final drugs = _drugs
        .where((d) =>
            d['name'].toString().toLowerCase().contains(query) ||
            d['category'].toString().toLowerCase().contains(query))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (doctors.isNotEmpty) ...[
          _buildSectionTitle('Doctors'),
          ...doctors.map((doctor) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: DoctorCard(
                  name: doctor['name'],
                  specialty: doctor['specialty'],
                  distance: doctor['distance'],
                  rating: doctor['rating'],
                  onTap: () => Navigator.pop(context),
                ),
              )),
        ],
        if (hospitals.isNotEmpty) ...[
          _buildSectionTitle('Hospitals'),
          ...hospitals.map((hospital) => _buildListItem(
                title: hospital['name'],
                subtitle: hospital['type'],
                trailing: hospital['distance'],
                icon: Icons.local_hospital_outlined,
                color: Colors.orange,
              )),
        ],
        if (pharmacies.isNotEmpty) ...[
          _buildSectionTitle('Pharmacies'),
          ...pharmacies.map((pharmacy) => _buildListItem(
                title: pharmacy['name'],
                subtitle: pharmacy['status'],
                trailing: pharmacy['distance'],
                icon: Icons.local_pharmacy_outlined,
                color: Colors.green,
              )),
        ],
        if (drugs.isNotEmpty) ...[
          _buildSectionTitle('Drugs'),
          ...drugs.map((drug) => _buildListItem(
                title: drug['name'],
                subtitle: drug['category'],
                trailing: drug['price'],
                icon: Icons.medication_outlined,
                color: Colors.blue,
              )),
        ],
        if (doctors.isEmpty &&
            hospitals.isEmpty &&
            pharmacies.isEmpty &&
            drugs.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'No results found for "$_searchQuery"',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildListItem({
    required String title,
    required String subtitle,
    required String trailing,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Text(
          trailing,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 13,
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
