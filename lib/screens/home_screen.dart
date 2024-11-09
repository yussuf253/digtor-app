import 'package:flutter/material.dart';
import '../constants/app_styles.dart';
import '../widgets/home/search_bar.dart';
import '../widgets/home/services_section.dart';
import '../widgets/home/promo_banner.dart';
import '../widgets/home/top_doctors_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête
              Container(
                padding: const EdgeInsets.fromLTRB(24, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Find your ',
                            style: AppStyles.titleLarge.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                              letterSpacing: -0.5,
                            ),
                          ),
                          TextSpan(
                            text: 'health solution',
                            style: AppStyles.titleLarge.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue[600],
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: Colors.black87,
                          size: 24,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const SearchBarWidget(),
              const SizedBox(height: 28),
              const ServicesSection(),
              const SizedBox(height: 28),
              const PromoBanner(),
              const SizedBox(height: 28),
              const TopDoctorsSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
