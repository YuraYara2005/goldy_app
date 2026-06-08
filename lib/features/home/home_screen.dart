import 'package:flutter/material.dart';
import '../../core/routes/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // Changed to dark mode
      appBar: AppBar(
        title: const Text(
          AppStrings.homeTitle,
          style: TextStyle(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent, // Modern transparent app bar
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Select a commodity to view live market analytics.',
              style: TextStyle(color: AppColors.textMuted, fontSize: 16),
            ),
            const SizedBox(height: 40),

            // Premium Gold Card
            _buildPremiumCard(
              context,
              title: AppStrings.goldCardTitle,
              subtitle: AppStrings.goldCardSubtitle,
              icon: Icons.monetization_on,
              accentColor: Colors.amberAccent,
              onTap: () => Navigator.pushNamed(
                context,
                Routes.goldDetails,
              ), // Now it works!
            ),

            const SizedBox(height: 24),

            // Premium Silver Card
            _buildPremiumCard(
              context,
              title: AppStrings.silverCardTitle,
              subtitle: AppStrings.silverCardSubtitle,
              icon: Icons.analytics,
              accentColor: Colors.grey.shade400,
              onTap: () => Navigator.pushNamed(context, Routes.silverDetails),
            ),
          ],
        ),
      ),
    );
  }

  // The newly designed premium card widget
  Widget _buildPremiumCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E), // Dark grey card surface
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white10, width: 1), // Subtle border
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.05),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: accentColor, size: 32),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: accentColor.withOpacity(0.5),
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
