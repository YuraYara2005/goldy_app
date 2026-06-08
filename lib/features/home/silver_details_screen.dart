import 'package:flutter/material.dart';
import '../../core/network/dio_helper.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/api_constants.dart';

class SilverDetailsScreen extends StatelessWidget {
  const SilverDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Market Deep Dive',
          style: TextStyle(color: AppColors.textLight),
        ),
        backgroundColor: AppColors.accent,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: DioHelper.getSilverData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.accent),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text(AppConstants.apiErrorMsg));
          }

          // Extract data maps safely from response structure
          final data = snapshot.data!.data;
          final rates = data['rates'];
          final changes = data['changes'];

          return Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Global Silver Metrics',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),

                // Price breakdowns
                _buildMetricRow(
                  'Ounce (oz)',
                  '\$${rates['per_ounce']} USD',
                  changes['percentage'],
                ),
                const Divider(),
                _buildMetricRow(
                  'Gram (g)',
                  '\$${rates['per_gram']} USD',
                  changes['percentage'],
                ),
                const Divider(),
                _buildMetricRow(
                  'Kilogram (kg)',
                  '\$${rates['per_kilogram']} USD',
                  changes['percentage'],
                ),

                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(
                      AppConstants.cardRadius,
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.accent),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Market data updates automatically. Ensure your device retains a stable internet connection.',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetricRow(String unit, String price, String change) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            unit,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              Text(
                change,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.green,
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
