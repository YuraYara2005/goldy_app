import 'package:flutter/material.dart';
import '../../core/network/dio_helper.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/api_constants.dart';

class GoldDetailsScreen extends StatelessWidget {
  const GoldDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Gold Market Data',
          style: TextStyle(color: AppColors.textLight),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.amberAccent),
      ),
      body: FutureBuilder(
        future: DioHelper.getMetalData('gold'), // Asking API for gold
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amberAccent),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text(
                AppConstants.apiErrorMsg,
                style: TextStyle(color: AppColors.textLight),
              ),
            );
          }

          final data = snapshot.data!.data;
          final rates = data['rates'];
          final changes = data['changes'];

          return Padding(
            padding: const EdgeInsets.all(AppConstants.largePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Live Gold Metrics',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(height: 32),

                _buildMetricCard(
                  'Ounce (oz)',
                  '\$${rates['per_ounce']} USD',
                  changes['percentage'],
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  'Gram (g)',
                  '\$${rates['per_gram']} USD',
                  changes['percentage'],
                ),
                const SizedBox(height: 16),
                _buildMetricCard(
                  'Kilogram (kg)',
                  '\$${rates['per_kilogram']} USD',
                  changes['percentage'],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetricCard(String unit, String price, String change) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.amberAccent.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            unit,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.textLight,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                ),
              ),
              Text(
                change,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
