import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/api_constants.dart';
import '../../core/constants/app_strings.dart';
import '../../core/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.largePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              const Icon(
                Icons.monetization_on,
                size: 80,
                color: AppColors.accent,
              ),
              const SizedBox(height: 32),
              const Text(
                AppStrings.loginHeader, // Updated to use AppStrings
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
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
                  Navigator.pushReplacementNamed(context, Routes.home);
                },
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Updated to use the Routes class
                  Navigator.pushNamed(context, Routes.register);
                },
                child: const Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(color: AppColors.textMuted),
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
