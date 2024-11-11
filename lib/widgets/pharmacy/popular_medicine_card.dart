import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/favorites_provider.dart';
import '../../screens/medicine/medicine_details_screen.dart';

class PopularMedicineCard extends StatelessWidget {
  final String id;
  final String name;
  final String type;
  final String description;
  final String price;
  final IconData icon;
  final Color color;

  const PopularMedicineCard({
    super.key,
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.price,
    this.icon = Icons.medication_outlined,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final favorites = Provider.of<FavoritesProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicineDetailsScreen(
              id: id,
              name: name,
              type: type,
              description: description,
              price: price,
              icon: icon,
              color: color,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec icône
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 40,
                  color: color,
                ),
              ),
            ),

            // Contenu
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    type,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: color,
                        ),
                      ),
                      Row(
                        children: [
                          // Bouton favoris
                          GestureDetector(
                            onTap: () {
                              favorites.toggleFavorite(
                                id,
                                name,
                                type,
                                price,
                                icon,
                                color,
                                description,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    favorites.isFavorite(id)
                                        ? 'Added to favorites'
                                        : 'Removed from favorites',
                                  ),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            },
                            child: Icon(
                              favorites.isFavorite(id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Bouton panier
                          GestureDetector(
                            onTap: () {
                              cart.addItem(
                                id,
                                name,
                                type,
                                price,
                                icon,
                                color,
                                description,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Added to cart'),
                                  duration: const Duration(seconds: 2),
                                  action: SnackBarAction(
                                    label: 'UNDO',
                                    onPressed: () {
                                      cart.removeItem(id);
                                    },
                                  ),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.add_shopping_cart,
                              color: Colors.blue,
                              size: 20,
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
