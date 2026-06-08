import 'package:flutter/material.dart';

class AppConstants {
  // Network Constants
  static const String baseUrl = 'https://api.metals.dev/v1/';
  static const String silverEndpoint = 'latest';

  // Validation Regular Expressions
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
  );

  // App UI Layout Padding & Radii
  static const double defaultPadding = 16.0;
  static const double largePadding = 24.0;
  static const double cardRadius = 16.0;
  static const double buttonRadius = 12.0;

  // Global Text Strings
  static const String appTitle = 'SilverVault';
  static const String loginHeader = 'Welcome Back';
  static const String registerHeader = 'Create Account';
  static const String apiErrorMsg =
      'Failed to fetch current market metrics. Please try again.';
}
