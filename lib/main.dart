import 'package:flutter/material.dart';
import 'package:gold_app/providers/notifications_provider.dart';
import 'package:gold_app/providers/withdrawal_provider.dart';
import 'package:gold_app/screens/round1_login/login_screen.dart';
import 'package:gold_app/screens/round2_notifications/notification_screen.dart';
import 'package:gold_app/screens/round3_withdrawals/withdrawal_screen.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';

void main() {
  // runApp(const Round1());//Login Screen

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => NotificationProvider(),
  //     child: const Round2(),
  //   ),
  // );// Notification Screen

  runApp(const Round3());// Withdrawals Screen

}

class Round1 extends StatelessWidget {
  const Round1({super.key});
   /*Login Screen*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}


class Round2 extends StatelessWidget {
  const Round2({super.key});
  /*
  Notification Screen
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const NotificationsScreen(),
    );
  }
}


class Round3 extends StatelessWidget {
  const Round3({super.key});
    /*  Withdrawal Screen    */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WithdrawalsProvider()),
          ChangeNotifierProvider(create: (_) => FilterProvider()),
        ],
        child: const WithdrawalsScreen(),
      ),
    );
  }
}
