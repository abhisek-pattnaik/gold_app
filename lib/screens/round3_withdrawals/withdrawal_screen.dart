import 'package:flutter/material.dart';
import 'package:gold_app/core/theme/app_colors.dart';
import 'package:gold_app/core/utils/AppStrings.dart';
import 'package:gold_app/core/utils/Utils.dart';
import 'package:gold_app/models/Withdrawal.dart';
import 'package:gold_app/providers/withdrawal_provider.dart';

import 'package:provider/provider.dart';

// Main Withdrawals Screen
class WithdrawalsScreen extends StatelessWidget {
  const WithdrawalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a1a1a),
      appBar: AppBar(
        backgroundColor: Color(0xFF1a1a1a),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.myWithdrawal,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary Card
              Consumer<WithdrawalsProvider>(
                builder: (context, withdrawalsProvider, _) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [AppColors.accentOrange, AppColors.accentYellow],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.totalWithdrawal,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '\$${withdrawalsProvider.getTotalWithdrawn().toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.totalTransactions,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${withdrawalsProvider.getTotalTransactions()}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.successRate,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${withdrawalsProvider.getSuccessRate()}%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 24),

              // Filter Buttons
              Consumer<FilterProvider>(
                builder: (context, filterProvider, _) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ['All', 'Completed', 'Processing', 'Failed']
                          .map((filter) {
                            bool isSelected =
                                filterProvider.selectedFilter == filter;
                            return Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  filterProvider.setFilter(filter);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.amber[600]
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected
                                          ? Colors.amber[600]!
                                          : Colors.grey[700]!,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    filter,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : AppColors.textPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                          .toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),

              // Withdrawals List
              Consumer2<WithdrawalsProvider, FilterProvider>(
                builder: (context, withdrawalsProvider, filterProvider, _) {
                  final filteredWithdrawals = filterProvider
                      .getFilteredWithdrawals(withdrawalsProvider.withdrawals);

                  if (filteredWithdrawals.isEmpty) {
                    return Center(
                      child: Text(
                        'No withdrawals found',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    );
                  }

                  return Column(
                    children: filteredWithdrawals
                        .map(
                          (withdrawal) =>
                              WithdrawalCard(withdrawal: withdrawal),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class WithdrawalCard extends StatelessWidget {
  final WithdrawalModel withdrawal;

  const WithdrawalCard({Key? key, required this.withdrawal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF2a2a2a),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Icon, Title, Amount
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Utils.getStatusColor(
                      withdrawal.status,
                    ).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Utils.getStatusIcon(withdrawal.status),
                    color: Utils.getStatusColor(withdrawal.status),
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                // Title and Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Withdrawal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '-\$${withdrawal.amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEF4444),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${withdrawal.type} • ${withdrawal.provider} - ${withdrawal.account}',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[400],
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Utils.getStatusColor(
                                withdrawal.status,
                              ).withOpacity(0.15),
                              border: Border.all(
                                color: Utils.getStatusColor(withdrawal.status),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              withdrawal.status,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Utils.getStatusColor(withdrawal.status),
                              ),
                            ),
                          ),
                        ],
                      ), //change here
                    ],
                  ),
                ),
                // Amount
              ],
            ),
            SizedBox(height: 12),
            // Bottom Row: ID, Fee, Status Badge, Date
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left: ID
                Expanded(
                  child: Text(
                    withdrawal.id,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ),
                // Fee
                Expanded(
                  child: Text(
                    'Fee: \$${withdrawal.fee.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ),
                //this code ....
                SizedBox(width: 12),
                // Date
                Text(
                  withdrawal.date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}