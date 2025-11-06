import 'package:flutter/material.dart';
import 'package:gold_app/core/theme/app_colors.dart';
class Utils{

  static IconData getStatusIcon(String status) {
    switch (status) {
      case 'Completed':
        return Icons.check_circle;
      case 'Processing':
        return Icons.schedule;
      case 'Failed':
        return Icons.error;
      default:
        return Icons.help_outline;
    }
  }

  static Color getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return AppColors.darkOliveGreen;
      case 'Processing':
        return AppColors.darkGoldenBrown;
      case 'Failed':
        return AppColors.deepBrickRed;
      default:
        return Colors.grey;
    }
  }
  static Color getWithdrawalStatusColor(String status){
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Processing':
        return AppColors.accentOrange;
      case 'Failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}