import 'package:flutter/material.dart';
import 'package:gold_app/models/Notification.dart';


class NotificationProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;
  late List<NotificationModel> _notifications;

  NotificationProvider() {
    _initializeNotifications();
  }

  bool get notificationsEnabled => _notificationsEnabled;

  List<NotificationModel> get notifications => _notifications;

  void _initializeNotifications() {
    _notifications = [
      NotificationModel(
        id: '1',
        icon: Icons.trending_up,
        iconBgColor: Colors.amber[800]!,
        title: 'Gold Price Alert!',
        subtitle:
        'Gold price reached \$1,005.20 per gram - 2% increase today',
        timeAgo: '660d ago',
        tag: 'Price Alert',
        tagColor: Colors.amber,
      ),
      NotificationModel(
        id: '2',
        icon: Icons.attach_money,
        iconBgColor: Colors.green[800]!,
        title: 'Transaction Successful',
        subtitle:
        'Your gold purchase of 0.5g has been completed successfully',
        timeAgo: '659d ago',
        tag: 'Transaction',
        tagColor: Colors.green,
      ),
      NotificationModel(
        id: '3',
        icon: Icons.shield,
        iconBgColor: Colors.red[800]!,
        title: 'Security Update',
        subtitle: 'New login detected from New Delhi, India',
        timeAgo: '660d ago',
        tag: 'Security',
        tagColor: Colors.red,
      ),
      NotificationModel(
        id: '4',
        icon: Icons.pie_chart,
        iconBgColor: Colors.blue[800]!,
        title: 'Weekly Portfolio Update',
        subtitle: 'Your portfolio gained 1.2% this week. View details',
        timeAgo: '661d ago',
        tag: 'Portfolio',
        tagColor: Colors.blue,
      ),
      NotificationModel(
        id: '5',
        icon: Icons.trending_up,
        iconBgColor: Colors.amber[800]!,
        title: 'Gold Price Drop',
        subtitle:
        'Gold price decreased to \$985.50 per gram - Good time to buy!',
        timeAgo: '662d ago',
        tag: 'Price Alert',
        tagColor: Colors.amber,
      ),
    ];
  }

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void deleteNotification(String id) {
    _notifications.removeWhere((notif) => notif.id == id);
    notifyListeners();
  }

  void clearAllNotifications() {
    _notifications.clear();
    notifyListeners();
  }

}