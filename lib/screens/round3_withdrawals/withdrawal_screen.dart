import 'package:flutter/material.dart';
import 'package:gold_app/core/utils/Utils.dart';
import 'package:gold_app/providers/withdrawal_provider.dart';

import 'package:provider/provider.dart';

// class WithdrawalsScreen extends StatefulWidget {
//   const WithdrawalsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<WithdrawalsScreen> createState() => _WithdrawalsScreenState();
// }
//
// class _WithdrawalsScreenState extends State<WithdrawalsScreen> {
//   String selectedFilter = 'All';
//
//   final List<Map<String, dynamic>> withdrawals = [
//     {
//       'amount': 500.00,
//       'type': 'Bank Transfer',
//       'provider': 'Jank Tran',
//       'account': '****1234',
//       'status': 'Completed',
//       'fee': 1.50,
//       'date': '15/1/2024',
//       'id': 'WD784512',
//       'icon': Icons.check_circle,
//       'iconColor': Colors.green,
//     },
//     {
//       'amount': 200.00,
//       'type': 'Mobile Money',
//       'provider': 'MTN Mobile',
//       'account': '****5678',
//       'status': 'Processing',
//       'fee': 1.00,
//       'date': '14/1/2024',
//       'id': 'WD784511',
//       'icon': Icons.schedule,
//       'iconColor': Colors.orange,
//     },
//     {
//       'amount': 1000.00,
//       'type': 'Bank Transfer',
//       'provider': 'Jank Tran',
//       'account': '****1234',
//       'status': 'Completed',
//       'fee': 2.50,
//       'date': '12/1/2024',
//       'id': 'WD784510',
//       'icon': Icons.check_circle,
//       'iconColor': Colors.green,
//     },
//     {
//       'amount': 150.00,
//       'type': 'Mobile Money',
//       'provider': 'Airtel Money',
//       'account': '****9012',
//       'status': 'Failed',
//       'fee': 1.00,
//       'date': '10/1/2024',
//       'id': 'WD784509',
//       'icon': Icons.error,
//       'iconColor': Colors.red,
//     },
//     {
//       'amount': 750.00,
//       'type': 'Bank Transfer',
//       'provider': 'Jank Tran',
//       'account': '****1234',
//       'status': 'Completed',
//       'fee': 2.00,
//       'date': '8/1/2024',
//       'id': 'WD784508',
//       'icon': Icons.check_circle,
//       'iconColor': Colors.green,
//     },
//   ];
//
//   List<Map<String, dynamic>> getFilteredWithdrawals() {
//     if (selectedFilter == 'All') return withdrawals;
//     return withdrawals
//         .where((w) => w['status'].toLowerCase() == selectedFilter.toLowerCase())
//         .toList();
//   }
//
//   Color getStatusColor(String status) {
//     switch (status) {
//       case 'Completed':
//         return Colors.green;
//       case 'Processing':
//         return Colors.orange;
//       case 'Failed':
//         return Colors.red;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final filtered = getFilteredWithdrawals();
//
//     return Scaffold(
//       backgroundColor: Color(0xFF1a1a1a),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF1a1a1a),
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text('My Withdrawals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Summary Card
//               Container(
//                 padding: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.amber[600],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Total Withdrawn', style: TextStyle(fontSize: 12, color: Colors.black54)),
//                             Text('\$2550.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Total Transactions', style: TextStyle(fontSize: 12, color: Colors.black54)),
//                             Text('6', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Success Rate', style: TextStyle(fontSize: 12, color: Colors.black54)),
//                             Text('83%', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 24),
//
//               // Filter Buttons
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: ['All', 'Completed', 'Processing', 'Failed'].map((filter) {
//                     bool isSelected = selectedFilter == filter;
//                     return Padding(
//                       padding: EdgeInsets.only(right: 8),
//                       child: GestureDetector(
//                         onTap: () => setState(() => selectedFilter = filter),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                           decoration: BoxDecoration(
//                             color: isSelected ? Colors.amber[600] : Colors.transparent,
//                             border: Border.all(
//                               color: isSelected ? Colors.amber[600]! : Colors.grey[700]!,
//                             ),
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Text(
//                             filter,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: 24),
//
//               // Withdrawals List
//               ...filtered.map((withdrawal) {
//                 return Padding(
//                   padding: EdgeInsets.only(bottom: 16),
//                   child: Container(
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Color(0xFF2a2a2a),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 40,
//                               height: 40,
//                               decoration: BoxDecoration(
//                                 color: withdrawal['iconColor'].withOpacity(0.2),
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 withdrawal['icon'],
//                                 color: withdrawal['iconColor'],
//                                 size: 20,
//                               ),
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Withdrawal', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     '${withdrawal['type']} • ${withdrawal['provider']} - ${withdrawal['account']}',
//                                     style: TextStyle(fontSize: 12, color: Colors.grey[400]),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               '-\$${withdrawal['amount'].toStringAsFixed(2)}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 12),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(withdrawal['id'], style: TextStyle(fontSize: 11, color: Colors.grey[500])),
//                                 Text('Fee: \$${withdrawal['fee'].toStringAsFixed(2)}', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
//                               ],
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                               decoration: BoxDecoration(
//                                 color: getStatusColor(withdrawal['status']).withOpacity(0.2),
//                                 border: Border.all(color: getStatusColor(withdrawal['status'])),
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               child: Text(
//                                 withdrawal['status'],
//                                 style: TextStyle(
//                                   fontSize: 11,
//                                   fontWeight: FontWeight.w500,
//                                   color: getStatusColor(withdrawal['status']),
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               withdrawal['date'],
//                               style: TextStyle(fontSize: 11, color: Colors.grey[500]),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






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
        title: Text('My Withdrawals',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.amber[600],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Withdrawn',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)),
                                Text(
                                  '\$${withdrawalsProvider.getTotalWithdrawn().toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total Transactions',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)),
                                Text(
                                  '${withdrawalsProvider.getTotalTransactions()}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Success Rate',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54)),
                                Text(
                                  '${withdrawalsProvider.getSuccessRate()}%',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                              ],
                            ),
                          ],
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
                        bool isSelected = filterProvider.selectedFilter == filter;
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              filterProvider.setFilter(filter);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              SizedBox(height: 24),

              // Withdrawals List
              Consumer2<WithdrawalsProvider, FilterProvider>(
                builder: (context, withdrawalsProvider, filterProvider, _) {
                  final filteredWithdrawals =
                  filterProvider.getFilteredWithdrawals(
                      withdrawalsProvider.withdrawals);

                  return Column(
                    children: filteredWithdrawals.map((withdrawal) {
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
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Utils.getStatusColor(withdrawal.status)
                                          .withOpacity(0.2),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Utils.getStatusIcon(withdrawal.status),
                                      color:
                                      Utils.getStatusColor(withdrawal.status),
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Withdrawal',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)),
                                        SizedBox(height: 4),
                                        Text(
                                          '${withdrawal.type} • ${withdrawal.provider} - ${withdrawal.account}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[400]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '-\$${withdrawal.amount.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(withdrawal.id,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[500])),
                                      Text(
                                          'Fee: \$${withdrawal.fee.toStringAsFixed(2)}',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.grey[500])),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Utils.getStatusColor(withdrawal.status)
                                          .withOpacity(0.2),
                                      border: Border.all(
                                          color: Utils.getStatusColor(
                                              withdrawal.status)),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      withdrawal.status,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: Utils.getStatusColor(
                                            withdrawal.status),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    withdrawal.date,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
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