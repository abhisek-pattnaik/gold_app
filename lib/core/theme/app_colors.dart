import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.grey;

  // colors
  static const Color darkGold = Color(0xFF4D411B);
  static const Color forestGreen = Color(0xFF2A3D2A);
  static const Color darkMaroon = Color(0xFF4B2727);
  static const Color deepBlueGray = Color(0xFF223748);
  static const Color darkOliveGreen = Color(0xFF2D3C29);
  static const Color darkGoldenBrown = Color(0xFF4D401E);
  static const Color deepBrickRed = Color(0xFF4A2826);

  static const Color accentOrange = Color(0xFFFF8C00);
  static const Color accentYellow = Color(0xFFFFC107);

  // 🟢 Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color processing = Color(0xFF2196F3);
  static const Color failed = Color(0xFFF44336);
  static const Color border = Color(0xFF2C2C2C);
  static const Color softRed = Color(0xFFDD4B4B);

  // 🔲 Card Shadow
  static const Color shadow = Colors.black54;

  // 🟣 Gradients
  static const LinearGradient goldGradient = LinearGradient(
    colors: [accentOrange, accentYellow],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 🔘 Button Gradient
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFFFFA726), Color(0xFFFF8C00)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
