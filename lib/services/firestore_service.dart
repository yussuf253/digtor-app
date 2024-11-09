import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Doctors
  Future<List<Map<String, dynamic>>> getDoctors() async {
    try {
      final snapshot = await _db.collection('doctors').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching doctors: $e');
      return [];
    }
  }

  // Pharmacies
  Future<List<Map<String, dynamic>>> getPharmacies() async {
    try {
      final snapshot = await _db.collection('pharmacies').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching pharmacies: $e');
      return [];
    }
  }

  // Hospitals
  Future<List<Map<String, dynamic>>> getHospitals() async {
    try {
      final snapshot = await _db.collection('hospitals').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching hospitals: $e');
      return [];
    }
  }

  // Medicines
  Future<List<Map<String, dynamic>>> getMedicines() async {
    try {
      final snapshot = await _db.collection('medicines').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching medicines: $e');
      return [];
    }
  }

  // Search across all collections
  Future<Map<String, List<Map<String, dynamic>>>> searchAll(
      String query) async {
    try {
      final results = {
        'doctors': <Map<String, dynamic>>[],
        'pharmacies': <Map<String, dynamic>>[],
        'hospitals': <Map<String, dynamic>>[],
        'medicines': <Map<String, dynamic>>[],
      };

      // Search in doctors
      final doctorsSnapshot = await _db
          .collection('doctors')
          .where('searchTerms', arrayContains: query.toLowerCase())
          .get();
      results['doctors'] =
          doctorsSnapshot.docs.map((doc) => doc.data()).toList();

      // Search in pharmacies
      final pharmaciesSnapshot = await _db
          .collection('pharmacies')
          .where('searchTerms', arrayContains: query.toLowerCase())
          .get();
      results['pharmacies'] =
          pharmaciesSnapshot.docs.map((doc) => doc.data()).toList();

      // Search in hospitals
      final hospitalsSnapshot = await _db
          .collection('hospitals')
          .where('searchTerms', arrayContains: query.toLowerCase())
          .get();
      results['hospitals'] =
          hospitalsSnapshot.docs.map((doc) => doc.data()).toList();

      // Search in medicines
      final medicinesSnapshot = await _db
          .collection('medicines')
          .where('searchTerms', arrayContains: query.toLowerCase())
          .get();
      results['medicines'] =
          medicinesSnapshot.docs.map((doc) => doc.data()).toList();

      return results;
    } catch (e) {
      print('Error searching: $e');
      return {
        'doctors': [],
        'pharmacies': [],
        'hospitals': [],
        'medicines': [],
      };
    }
  }
}
