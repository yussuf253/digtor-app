import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  // Styles de texte
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Styles de décoration
  static final cardDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 20,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static final surfaceDecoration = BoxDecoration(
    color: AppColors.surfaceVariant,
    borderRadius: BorderRadius.circular(12),
  );

  // Styles de boutons
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.5,
  );

  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 0,
  );

  static final ButtonStyle outlinedButton = OutlinedButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    side: const BorderSide(color: AppColors.primary),
  );

  static final ButtonStyle textButton = TextButton.styleFrom(
    foregroundColor: AppColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
