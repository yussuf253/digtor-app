import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double get deliveryFee => 5.99;

  double get tax {
    return totalAmount * 0.1;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, item) {
      total += double.parse(item.price.replaceAll('\$', '')) * item.quantity;
    });
    return total;
  }

  double get finalTotal {
    return totalAmount + deliveryFee + tax;
  }

  void addItem(
    String id,
    String name,
    String type,
    String price,
    IconData icon,
    Color color,
    String description,
  ) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          type: existingItem.type,
          price: existingItem.price,
          icon: existingItem.icon,
          color: existingItem.color,
          description: existingItem.description,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
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

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void decrementQuantity(String id) {
    if (!_items.containsKey(id)) return;

    if (_items[id]!.quantity > 1) {
      _items.update(
        id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          type: existingItem.type,
          price: existingItem.price,
          icon: existingItem.icon,
          color: existingItem.color,
          description: existingItem.description,
          quantity: existingItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
