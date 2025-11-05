import 'package:flutter/material.dart';
import 'package:gold_app/models/Withdrawal.dart';

class WithdrawalsProvider extends ChangeNotifier {
  List<WithdrawalModel> _withdrawals = [
    WithdrawalModel(
      amount: 500.00,
      type: 'Bank Transfer',
      provider: 'Jank Tran',
      account: '****1234',
      status: 'Completed',
      fee: 1.50,
      date: '15/1/2024',
      id: 'WD784512',
    ),
    WithdrawalModel(
      amount: 200.00,
      type: 'Mobile Money',
      provider: 'MTN Mobile',
      account: '****5678',
      status: 'Processing',
      fee: 1.00,
      date: '14/1/2024',
      id: 'WD784511',
    ),
    WithdrawalModel(
      amount: 1000.00,
      type: 'Bank Transfer',
      provider: 'Jank Tran',
      account: '****1234',
      status: 'Completed',
      fee: 2.50,
      date: '12/1/2024',
      id: 'WD784510',
    ),
    WithdrawalModel(
      amount: 150.00,
      type: 'Mobile Money',
      provider: 'Airtel Money',
      account: '****9012',
      status: 'Failed',
      fee: 1.00,
      date: '10/1/2024',
      id: 'WD784509',
    ),
    WithdrawalModel(
      amount: 750.00,
      type: 'Bank Transfer',
      provider: 'Jank Tran',
      account: '****1234',
      status: 'Completed',
      fee: 2.00,
      date: '8/1/2024',
      id: 'WD784508',
    ),
  ];

  List<WithdrawalModel> get withdrawals => _withdrawals;

  void addWithdrawal(WithdrawalModel withdrawal) {
    _withdrawals.add(withdrawal);
    notifyListeners();
  }

  void removeWithdrawal(String id) {
    _withdrawals.removeWhere((w) => w.id == id);
    notifyListeners();
  }

  void updateWithdrawal(String id, WithdrawalModel updatedWithdrawal) {
    final index = _withdrawals.indexWhere((w) => w.id == id);
    if (index != -1) {
      _withdrawals[index] = updatedWithdrawal;
      notifyListeners();
    }
  }

  double getTotalWithdrawn() {
    return _withdrawals.fold(0.0, (sum, w) => sum + w.amount);
  }

  int getTotalTransactions() {
    return _withdrawals.length;
  }

  String getSuccessRate() {
    if (_withdrawals.isEmpty) return '0';
    final completedCount = _withdrawals
        .where((w) => w.status == 'Completed')
        .length;
    return ((completedCount / _withdrawals.length) * 100).toStringAsFixed(0);
  }
}



class FilterProvider extends ChangeNotifier {
  String _selectedFilter = 'All';

  String get selectedFilter => _selectedFilter;

  void setFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  List<WithdrawalModel> getFilteredWithdrawals(List<WithdrawalModel> withdrawals) {
    if (_selectedFilter == 'All') return withdrawals;
    return withdrawals
        .where((w) => w.status.toLowerCase() == _selectedFilter.toLowerCase())
        .toList();
  }
}
