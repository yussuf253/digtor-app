import 'package:flutter/material.dart';

class FavoriteItem {
  final String id;
  final String name;
  final String type;
  final String price;
  final IconData icon;
  final Color color;
  final String description;

  FavoriteItem({
    required this.id,
    required this.name,
    required this.type,
    required this.price,
    required this.icon,
    required this.color,
    required this.description,
  });
}

class FavoritesProvider with ChangeNotifier {
  final Map<String, FavoriteItem> _items = {};

  Map<String, FavoriteItem> get items => {..._items};

  int get itemCount => _items.length;

  bool isFavorite(String id) => _items.containsKey(id);

  void toggleFavorite(
    String id,
    String name,
    String type,
    String price,
    IconData icon,
    Color color,
    String description,
  ) {
    if (_items.containsKey(id)) {
      _items.remove(id);
    } else {
      _items.putIfAbsent(
        id,
        () => FavoriteItem(
          id: id,
          name: name,
          type: type,
          price: price,
          icon: icon,
          color: color,
          description: description,
        ),
      );
    }
    notifyListeners();
  }

  void removeFromFavorites(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clearFavorites() {
    _items.clear();
    notifyListeners();
  }
}
