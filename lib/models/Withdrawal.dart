

class WithdrawalModel {
  final double amount;
  final String type;
  final String provider;
  final String account;
  final String status;
  final double fee;
  final String date;
  final String id;

  WithdrawalModel({
    required this.amount,
    required this.type,
    required this.provider,
    required this.account,
    required this.status,
    required this.fee,
    required this.date,
    required this.id,
  });

  WithdrawalModel copyWith({
    double? amount,
    String? type,
    String? provider,
    String? account,
    String? status,
    double? fee,
    String? date,
    String? id,
  }) {
    return WithdrawalModel(
      amount: amount ?? this.amount,
      type: type ?? this.type,
      provider: provider ?? this.provider,
      account: account ?? this.account,
      status: status ?? this.status,
      fee: fee ?? this.fee,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }
}
