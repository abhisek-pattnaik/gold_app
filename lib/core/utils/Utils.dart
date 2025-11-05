import 'package:flutter/material.dart';
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
        return Colors.green;
      case 'Processing':
        return Colors.orange;
      case 'Failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}