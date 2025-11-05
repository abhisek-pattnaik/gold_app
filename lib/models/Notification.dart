import 'package:flutter/material.dart';

class NotificationModel {
  final String id;
  final IconData icon;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final String timeAgo;
  final String tag;
  final Color tagColor;

  NotificationModel({
    required this.id,
    required this.icon,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    required this.tag,
    required this.tagColor,
  });
}