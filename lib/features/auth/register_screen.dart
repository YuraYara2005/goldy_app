import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/api_constants.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textLight),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.largePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                AppStrings.registerHeader, // Updated to use AppStrings
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign up to track real-time silver commodities.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14),
              ),
              const SizedBox(height: 32),
              _buildInputField(hint: 'Full Name', icon: Icons.person),
              const SizedBox(height: 16),
              _buildInputField(hint: 'Email Address', icon: Icons.email),
              const SizedBox(height: 16),
              _buildInputField(
                hint: 'Password',
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppConstants.buttonRadius,
                    ),
                  ),
                ),
                onPressed: () {
                  // Updated to use the Routes class
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.home,
                    (route) => false,
                  );
                },
                child: const Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: AppColors.textLight),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.textMuted),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
