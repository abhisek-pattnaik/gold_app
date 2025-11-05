import 'package:flutter/material.dart';
import 'package:gold_app/core/theme/app_colors.dart';

import '../../core/theme/app_text_style.dart';
import '../../core/utils/AppStrings.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gold App Title
                Center(
                  child: Text(
                    AppStrings.appName,
                    style: AppTextStyle.appHeading,
                  ),
                ),
                const SizedBox(height: 60),

                // Welcome Back
                Text(
                  AppStrings.welcomeMessage,
                  style:AppTextStyle.heading1
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.loginMessage,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey[400]),
                ),
                const SizedBox(height: 40),

                // Login / Register Toggle
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLoginSelected = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: _isLoginSelected
                                ? AppColors.accentOrange
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.login,
                              style: TextStyle(
                                color: _isLoginSelected
                                    ? Colors.black
                                    : Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLoginSelected = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: !_isLoginSelected
                                ? AppColors.accentOrange
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              AppStrings.register,
                              style: TextStyle(
                                color: !_isLoginSelected
                                    ? Colors.black
                                    : Colors.grey[400],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Email Field
                Text(
                  AppStrings.email,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[300]),
                ),
                const SizedBox(height: 8),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppStrings.emailHint,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Password Field
                Text(
                  AppStrings.password,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[300]),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: _obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: AppStrings.passwordHint,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    filled: true,
                    fillColor: Colors.grey[850],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentOrange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Forgot Password
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      AppStrings.forgotPassword,
                      style: TextStyle(
                        color: AppColors.accentOrange,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
