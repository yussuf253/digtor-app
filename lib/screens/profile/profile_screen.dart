import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Photo de profil et informations
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'James Bond',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Personal account',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.primary,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Menu items
          _buildMenuItem(
            icon: Icons.person_outline,
            title: 'Personal Data',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.history,
            title: 'Consultation History',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.local_hospital_outlined,
            title: 'Medical Records',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Location',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.payment_outlined,
            title: 'Payment Method',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.help_outline,
            title: 'Help Center',
            onTap: () {},
          ),
          _buildMenuItem(
            icon: Icons.shield_outlined,
            title: 'Privacy Policy',
            onTap: () {},
          ),

          const SizedBox(height: 32),

          // Bouton de déconnexion
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.logout, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
    );
  }
}
